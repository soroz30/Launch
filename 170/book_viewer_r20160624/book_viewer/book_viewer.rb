require "sinatra"
require "sinatra/reloader" if development?

before do
  @contents = File.readlines("data/toc.txt")
end

helpers do
  def slugify(text)
    text.downcase.gsub(/\s+/, "-").gsub(/[^\w-]/, "")
  end

  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def each_chapter(&block)
    @contents.each_with_index do |name, index|
      number = index + 1
      contents = File.read("data/chp#{number}.txt")
      yield number, name, contents
    end
  end

  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end

  def chapters_matching(query)
    results = []

    return results unless query

    each_chapter do |number, name, contents|
      matches = {}
      contents.split("\n\n").each_with_index do |paragraph, index|
        next unless paragraph.include?(query)
        matches[index] = create_mark(paragraph, query)
      end
      results << { number: number, name: name, paragraphs: matches } if matches.any?
    end

    results
  end
end

not_found do
  redirect "/"
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number} : #{chapter_name}"

  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/show/:name" do
  params[:name]
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end