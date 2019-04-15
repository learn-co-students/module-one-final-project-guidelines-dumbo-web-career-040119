require_relative '../config/environment'
require_relative 'prompts'

puts "Welcome user. If you're interested in some threads, you've come to the right place. Talk to me about what's important to you."

#user has the opportunity to make a freeform input and the program will search for certain keywords to determine its course. If none are found, proceeds to its default course.

def input_analyzer_first_question(string)
  if string.include? "price"
    return answer = "price case"
  elsif string.include? "style"
    return answer = "name case"
  else
    return answer = "default"
  end
end

input = gets.chomp

if input_analyzer_first_question(input) == "price case"
  puts "No problem, let's get you stuff that'll leave your wallet happy."
  sleep(1)
  articles_prompt.select("What kind of clothes are we looking for?", %w( Shoes Pants Tops))
end


puts "HELLO WORLD"
