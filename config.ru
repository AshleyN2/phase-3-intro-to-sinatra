require 'sinatra'

class App < Sinatra::Base

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  # defining a second route 
  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  # different format response
  # sends back a random number btwn 1 & 6
  get '/dice' do
    dice_roll = rand(1..6)
    "<h2>You rolled a #{dice_roll}</h2>"
  end

  # Add this line to set the Content-Type header for all responses
  set :default_content_type, 'application/json'

  # generates JSON data
  get '/dice2' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end

  # API for math operations
  # :num1 and :num2 are named parameters
  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i # params hash variable
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end
  # *not very practical with math operations*
  
end

run App
