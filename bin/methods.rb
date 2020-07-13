require_relative '../config/environment'

##quarantine folder for methods under development.

def allergy?(suggestion)
  TTY:Prompt.new
  prompt.select("Oh hey, do you have an allergy to #{suggestion.material?}") do |menu|
    menu.choice 'No', -> {nil}
    menu.choice 'Yes'
  end
end

def input_analyzer_first_question(string)
  if string.include? "price"
    analyze_feedback_budget
  elsif string.include? "cheap"
    analyze_feedback_budget
  elsif string.include? "lowest"
    analyze_feedback_budget
  elsif string.include? "style"
    analyze_feedback_luxury
  elsif string.include? "expensive"
    analyze_feedback_luxury
  elsif string.include? "highest"
    analyze_feedback_luxury
  elsif string.include? "brand"
    analyze_feedback_brand
  else
    analyze_feedback_random
  end
end

def something_specific(input)
  suggestion = input
  puts "All right, how about some #{suggestion.name}? They're worth $#{suggestion.price}."
  exit_or_retry?

end

def analyze_feedback_brand
  puts "Do you want something with a label on it?"
  sleep(1)
  puts "Alright, is this flashy enough for you?"
  puts "------------------"
  brand_question
  exit_or_retry?
end


def analyze_feedback_random
    sleep(1)
    puts "Maybe you're having a hard time choosing? May I throw out some suggestions?"
    sleep(1)
    puts "."
    sleep(1)
    puts ".."
    sleep(1)
    puts "..."
    sleep(3)
    random_selection = Clothing.random
    puts "How about some #{random_selection.name}? They're $#{random_selection.price}."
    sleep(1)
    exit_or_retry?
end
