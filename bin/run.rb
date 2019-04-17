require_relative '../config/environment'
require_relative 'methods'
# require_all './models'

def welcome
  puts "Welcome user!"
  get_feedback
end

def get_feedback
  puts "If you're interested in some threads, you've come to the right place. Talk to me about what's important to you."
#user has the opportunity to make a freeform input and the program will search for certain keywords to determine its course. If none are found, proceeds to its default course.
  first_question_input = gets.chomp
  input_analyzer_first_question(first_question_input)
end

def input_analyzer_first_question(string)
  if string.include? "price"
    analyze_feedback_budget
  elsif string.include? "style"
    analyze_feedback_luxury
  elsif string.include? "brand"
    return answer = "brand"
  else
    return answer = "default"
  end
end
#user makes a choice of what slot of clothing they want (pants, shoes, etc.) to provide the program with the second search criteria
def analyze_feedback_budget
    puts "No problem, let's get you stuff that'll leave your wallet happy."
    sleep(1)
    suggestion = Brand.choose_budget(articles_question)
    puts "All right, how about #{suggestion.name}? Only costs $#{suggestion.price}."
    exit_or_retry?
end

def analyze_feedback_luxury
    puts "No problem, let's get you looking fancy."
    sleep(1)
    suggestion = Brand.choose_luxury(articles_question)
    puts "All right, how about #{suggestion.name}? They're worth $#{suggestion.price}."
    exit_or_retry?
end

def analyze_feedback_random
    puts "Maybe you're having a hard time choosing? Here, let me throw out a random suggestion!"
    random_selection = Clothing.random
    puts "How's #{random_selection.name}? They're #{random_selection.price}."
    exit_or_retry?
end

def analyze_feedback_brand
  puts "Want something with a label on it?"
  brand_question
  sleep(1)
  puts "All right, any of these flashy enough for you?"
  Brand.choose_brand(articles_question_input).each do |element|
    puts element.name
  end
end

def articles_question
  prompt = TTY::Prompt.new
  sleep(1)
    prompt.select("What kind of clothes are we looking for?") do |menu|
      menu.choice 'Shirts'
      menu.choice 'Pants'
      menu.choice 'Shoes'
    end
end

def brand_question
  prompt = TTY::Prompt.new
  prompt.select("Whose clothes are we wearing?")
    menu.choice 'Adidas'
    menu.choice 'Nike'
    menu.choice 'Reebok'
    menu.choice 'Under Armor'
end


def exit_or_retry?
  prompt = TTY::Prompt.new
  prompt.select("Want to go again, or are you done for now?") do |menu|
    menu.choice 'Try Again', -> {new_round}
    menu.choice 'Exit', -> {exit}
  end
end

def new_round
 puts "Looking for more stuff? I got you. Talk to me again."
  first_question_input = gets.chomp
  input_analyzer_first_question(first_question_input)
end

def exit
  puts "Hope I could help and hope you leave looking sharp."
end

welcome
