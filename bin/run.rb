require_relative '../config/environment'
require_relative 'methods'
# require_all './models'


puts "Welcome user. If you're interested in some threads, you've come to the right place. Talk to me about what's important to you."

#user has the opportunity to make a freeform input and the program will search for certain keywords to determine its course. If none are found, proceeds to its default course.
first_question_input = gets.chomp

#user makes a choice of what slot of clothing they want (pants, shoes, etc.) to provide the program with the second search criteria
if input_analyzer_first_question(first_question_input) == "budget"
  puts "No problem, let's get you stuff that'll leave your wallet happy."
  sleep(1)
  puts "What kind of clothes are we looking for?"
  articles_question_input = gets.chomp
  puts "All right, how about #{Brand.choose_budget(articles_question_input).name}? Only costs $#{Brand.choose_budget(articles_question_input).price}."

elsif input_analyzer_first_question(first_question_input) == "luxury"
  puts "No problem, let's get you looking fancy."
  sleep(1)
  puts "What kind of clothes are we looking for?"
  articles_question_input = gets.chomp
  puts "All right, how about #{Brand.choose_luxury(articles_question_input).name}? They're worth $#{Brand.choose_luxury(articles_question_input).price}."

elsif input_analyzer_first_question(first_question_input) == "brand"
  puts "Want something with a label on it?"
  puts "Whose clothes are we looking for?"
  articles_question_input = gets.chomp
  puts "All right, any these flashy enough for you?"
  Brand.choose_brand(articles_question_input).each do |element|
    puts element.name
  end
else input_analyzer_first_question(first_question_input) == "default"
  puts "Maybe you're having a hard time choosing? Here, let me throw out a random suggestion!"
  random_selection = Clothing.random
  puts "How's #{random_selection.name}? They're #{random_selection.price}. Made of some nice #{random_selection.material}."
end
