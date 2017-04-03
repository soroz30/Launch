require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"
require "redcarpet"
require "fileutils"
require "yaml"
require "bcrypt"
require "pry"

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

helpers do
  def list_of_versions(file)
    path = version_dir_path(file.split('.'))
    files = Dir.entries(path).reject { |entry| entry[0] == "." || entry.include?("~") }
    files.sort_by { |file| File.ctime(path + "/" + file) }
  end

  def last_version(file)
    list_of_versions(file)[-1]
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def version_dir_path(split)
  File.expand_path("#{split[0]}_#{split[1]}", data_path)
end

def credentials_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
end

def load_user_credentials
  path = credentials_path
  YAML.load_file(path)
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end.select { |file| file.include? (".") }
  erb :index
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

def user_signed_in?
  session.key?(:username)
end

def require_signed_in_user
  unless user_signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

get "/new" do
  require_signed_in_user

  erb :new
end

get "/new_image" do
  require_signed_in_user

  erb :new_image
end

get "/duplicate/:filename" do
  require_signed_in_user
  file_path = File.join(data_path, params[:filename])
  content = File.read(file_path)
  session[:duplicate] = content

  erb :new
end

def validate_document(split)
  return "A name is required" if split.size == 0
  if split.size != 2 || ["md", "txt"].none? { |id| id == split[1] } 
    "Incorrect format"
  else
    nil
  end
end

post "/create" do
  require_signed_in_user

  filename = params[:filename].to_s
  split = filename.split(".")
  validation = validate_document(split)

  if validation
    session[:message] = validation
    status 422
    erb :new
  else
    file_path = File.join(data_path, filename)
    content = session[:duplicate].nil? ? "" : session.delete(:duplicate)

    File.write(file_path, content)
    @version_dir_path = version_dir_path(split)
    Dir.mkdir(@version_dir_path)
    default_version_path = File.join(@version_dir_path, "#{File.basename(filename, ".*")}_default#{File.extname(filename)}")
    File.write(default_version_path, content)

    session[:message] = "#{params[:filename]} has been created."
    redirect "/"
  end
end

def validate_image(filename)
  return "A name is required" if filename.size == 0
  if filename.split(".").size > 1 
    "Incorrect format, please use only name"
  else 
    nil
  end
end

post "/new_image" do
  require_signed_in_user

  filename = params[:filename].to_s
  validation = validate_image(filename)

  if validation
    session[:message] = validation
    status 422
    erb :new_image
  else
    file_path = File.join(data_path, (filename + ".md"))
    content = "![#{filename}](#{params[:image_path]})"

    File.write(file_path, content)
    session[:message] = "#{filename} has been created."

    redirect "/"
  end
end

get "/:filename" do
  file_path = File.join(data_path, params[:filename])

  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

get "/:filename/edit/:version" do
  require_signed_in_user

  file_path = File.join(version_dir_path(params[:filename].split('.')), params[:version])

  @filename = params[:filename]
  @content = File.read(file_path)

  erb :edit
end

post "/:filename/:version" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  version_path = File.join(version_dir_path(params[:filename].split('.')), params[:version])

  File.write(version_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated"
  redirect "/"
end

post "/:filename/destroy" do
  require_signed_in_user
  
  file_path = File.join(data_path, params[:filename])
  File.delete(file_path)
  session[:message] =  "#{params[:filename]} has been deleted."
  redirect "/"
end

get "/users/signin" do
  erb :signin
end

post "/users/signin" do
  credentials = load_user_credentials
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = params[:username]
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid credentials"
    status 422
    erb :signin
  end
end

post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

get "/users/signup" do
  @credentials = load_user_credentials
  erb :signup
end

def check_username(username, credentials)
  if credentials.keys.include? params[:username]
    session[:message] = "Username taken"
    redirect "/users/signup"
  end
end

def store_data(username, password)
  data = load_user_credentials
  data[username] = password.to_s
  File.write(credentials_path, YAML.dump(data))
end

post "/users/signup" do
  username = params[:username]
  credentials = load_user_credentials
  check_username(username, credentials)
  password = BCrypt::Password.create(params[:password])
  store_data(username, password)
  session[:message] = "New account created"
  redirect "/"
end