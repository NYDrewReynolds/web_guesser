require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER= rand(101)

def check_guess(guess)
  if guess == SECRET_NUMBER
    "You got it right!"
  elsif (guess - SECRET_NUMBER) > 5
    message = "Way too high!"
  elsif (SECRET_NUMBER - guess) > 5
    message = "Way too low!"
  elsif guess > SECRET_NUMBER
    message = "Too high!"
  elsif guess < SECRET_NUMBER
    message = "Too low!"
  end
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :guess => guess}
end
