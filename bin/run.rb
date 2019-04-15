require_relative '../config/environment'

puts "Welcome user. If you're interested in some threads, you've come to the right place. Talk to me about what's important to you."

input = gets.chomp #user has the opportunity to make a freeform input and the program will search for certain keywords to determine its course. If none are found, proceeds to its default course.

def input_analyzer
  if input.include? "price","cost","value"
    "price case"
  elsif input.include? "style","name","brand"
    "name case"
  else
    "default"
  end
end

# if input_analyzer == "price case"
#   "No problem, let's get you stuff that'll leave your wallet happy."
#


puts "HELLO WORLD"
