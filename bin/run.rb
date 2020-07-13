require_relative '../config/environment'
require_relative 'methods'
# require_all './models'

#1. begins the chain of events, invoked at the bottom of this file
def welcome
  puts "Welcome user!"
  puts "If you're interested in some threads, you've come to the right place !"
  get_feedback
end

#2. invoked by #1, directs the user to choose between four options that send the program down different roads
def get_feedback
  prompt = TTY::Prompt.new
  # sleep(1)
  puts "--------------------------------"
  # sleep(1)
  prompt.select("Tell me what's important to you.") do |menu|
    menu.choice 'Low Price', -> {analyze_feedback_budget}
    menu.choice 'High Price', -> {analyze_feedback_luxury}
    menu.choice 'Brand Names', -> {brand_question}
    menu.choice 'Something specific.', -> {products_list(choose_something_specific(Clothing.slot_sorter(articles_question)))}
  end
end

#3a. invoked by #2's first option, sends the user down the path to make a choice of cheaper brands
def analyze_feedback_budget
    puts "No problem, let's get you something that will leave your wallet happy."
    sleep(1)
    suggestion = Brand.choose_budget(articles_question)
    puts "All right, how about some #{suggestion.name}? They only cost $#{suggestion.price}."
    exit_or_retry?
end

#3b. invoked by #2's second option, sends the user down the path to make a choice of expensive brands
def analyze_feedback_luxury
    puts "No problem, let's get you looking fancy."
    # sleep(2)
    suggestion = Brand.choose_luxury(articles_question)
    puts "All right, how about some #{suggestion.name}? They're worth $#{suggestion.price}."
    exit_or_retry?
end

#3c. invoked by #2's third option, directs the user to make a choice between brands
def brand_question
  prompt = TTY::Prompt.new
  prompt.select("What brands do you like wearing?") do |menu|
    menu.choice 'Adidas', -> {adidas_list}
    menu.choice 'Nike', -> {nike_list}
    menu.choice 'Reebok', -> {reebok_list}
    menu.choice 'Under Armour', -> {ua_list}
  end
end

#3d/helper method. invoked by multiple methods, this prompts the user to choose a slot they'd like to equip
def articles_question
  prompt = TTY::Prompt.new
  sleep(1)
    prompt.select("What kind of clothes are we looking for?") do |menu|
      menu.choice 'Shirts'
      menu.choice 'Pants'
      menu.choice 'Shoes'
    end
end

#3di. invoked by #2's fourth option in chain with #3d, this populates the prompt with an array of all clothing that matches the desired slot
def choose_something_specific(input)
  prompt = TTY::Prompt.new
  prompt.select("How about you pick one of these?", input)
end

#3ci. invoked by #2's third option in chain with 3c, populates a prompt with clothings that belong to Adidas
def adidas_list
  prompt = TTY::Prompt.new
  sleep(1)
  products = Brand.choose_brand_items("Adidas")
   products_list(prompt.select("Here are the available choices for this brand.", products))
end

#3ci. invoked by #2's third option in chain with 3c, populates a prompt with clothings that belong to Nike
def nike_list
  prompt = TTY::Prompt.new
  sleep(1)
  products = Brand.choose_brand_items("Nike")
  products_list(prompt.select("Here are the available choices for this brand.", products))
end

#3ci. invoked by #2's third option in chain with 3c, populates a prompt with clothings that belong to Reebok
def reebok_list
  prompt = TTY::Prompt.new
  sleep(1)
  products = Brand.choose_brand_items("Reebok")
  products_list(prompt.select("Here are the available choices for this brand.", products))
end

#3ci. invoked by #2's third option in chain with 3c, populates a prompt with clothings that belong to Under Armour
def ua_list
  prompt = TTY::Prompt.new
  sleep(1)
  products = Brand.choose_brand_items("Under Armour")
  products_list(prompt.select("Here are the available choices for this brand.", products))
end

#3cii. invoked by #2's thid option in chain with 3c and 3ci, outputs the user's choice along with price
def products_list(list)
  puts "Great choice! The #{list} costs $#{Clothing.locate_product(list).price}."
  exit_or_retry?
end

#4. invoked by multiple methods, prompts to user to choose between a new cycle and exiting the program
def exit_or_retry?
  prompt = TTY::Prompt.new
  prompt.select("Do you want to go again, or are you done for now?") do |menu|
    menu.choice 'Try Again', -> {new_round}
    menu.choice 'Exit', -> {exit}
  end
end

#5a. invoked by #4's first option, sends the user back to #2
def new_round
 puts "Looking for more stuff? I got you."
 get_feedback
end

#5b. invoked by #4's second option, terminates the program with a message
def exit
  puts "Hope I could help and hope you leave looking sharp."
end

welcome
