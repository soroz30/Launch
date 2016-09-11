require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def messages(message, lang = "EN")
  MESSAGES[lang][message]
end

def prompt(message)
  message = messages(message, LANGUAGE)
  Kernel.puts("-> #{message}")
end

def gets_input
  Kernel.print("-> ")
  gets.chomp()
end

def higher_than_zero?(input)
  input.to_f() > 0.0
end

def valid_input?(input)
  input.match(/^\d+\z|^\d+\.\d+\z/) && higher_than_zero?(input)
end

def valid_years_input?(input)
  input.match(/^\d+\z/) && higher_than_zero?(input)
end

def input_and_validation
  input = ""
  loop do
    input = gets_input()
    break if valid_input?(input)
    prompt('input_error')
  end
  input
end

def years_input_and_validation
  input = ""
  loop do
    input = gets_input()
    break if valid_years_input?(input)
    prompt('years_error')
  end
  input
end

def monthly_payment(loan_amount, apr_rate, years)
  months = years.to_i() * 12
  apr_rate = apr_rate.to_f() / 100
  monthly_interest_rate = apr_rate / 12

  loan_amount.to_f() * (monthly_interest_rate /
                       (1 - (1 + monthly_interest_rate)**-months))
end

Kernel.puts("-> Enter EN for English, Wpisz PL dla jezyka polskiego")

loop do
  language = gets_input()

  if language == "EN" || language == "PL"
    LANGUAGE = language
    break
  else
    Kernel.puts('-> Wrong input, please enter EN for English.'\
                ' Blad, wpisz PL dla polskiego ')
  end
end

prompt('welcome')

loop do
  prompt('loan_amount')

  loan_amount = input_and_validation

  prompt('apr_input')

  apr_rate = input_and_validation

  prompt('years_input')

  years = years_input_and_validation

  monthly_payment = monthly_payment(loan_amount, apr_rate, years)

  result = <<-MSG
   Loan amout: $#{loan_amount}
   Annual Percentage RATE: #{apr_rate}%
   Loan duration in years: #{years}
   Your monthly payment => $#{format('%02.2f', monthly_payment)}
  MSG

  puts result

  prompt('again')
  answer = gets_input.upcase()

  loop do
    if answer != "Y" && answer != "N"
      prompt('answer_error')
      answer = gets_input()
    else
      break
    end
  end

  next if answer == "Y"

  break
end

prompt('thanks')