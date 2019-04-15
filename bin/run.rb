require_relative '../config/environment'
require_relative 'prompts'
require_relative 'methods'

puts "Welcome user. If you're interested in some threads, you've come to the right place. Talk to me about what's important to you."

#user has the opportunity to make a freeform input and the program will search for certain keywords to determine its course. If none are found, proceeds to its default course.
first_question_input = gets.chomp


#user makes a choice of what slot of clothing they want (pants, shoes, etc.) to provide the program with the second search criteria
if input_analyzer_first_question(first_question_input) == "budget"
  puts "No problem, let's get you stuff that'll leave your wallet happy."
  sleep(1)
  puts "What kind of clothes are we looking for?"
  articles_question_input = gets.chomp
elsif input_analyzer_first_question(first_question_input) == "luxury"
  puts "No problem, let's get you looking fancy."
  sleep(1)
  puts "What kind of clothes are we looking for?"
  articles_question_input = gets.chomp
end

#with two criteria (top attribute concern and clothing type, the program can now make a suggestion)

if input_analyzer_first_question(first_question_input) == "budget"
  suggestion = choose_price_case(articles_question_input)
  puts "All right, how about #{suggestion.name}? Only costs #{suggestion.price}."
elsif input_analyzer_first_question(first_question_input) == "luxury"
end



puts "HELLO WORLD"
