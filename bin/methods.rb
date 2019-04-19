require_relative '../config/environment'

##quarantine folder for methods under development and methods made obsolete



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

def self.choose_slot(suggestion, articles_question_input)
  dummy = suggestion.select{|brand| brand.clothings}
end
