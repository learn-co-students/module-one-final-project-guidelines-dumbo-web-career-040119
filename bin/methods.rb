def input_analyzer_first_question(string)
  if string.include? "price"
    return answer = "budget"
  elsif string.include? "style"
    return answer = "luxury"
  elsif string.include? "brand"
    return answer = "brand"
  else
    return answer = "default"
  end
end

def input_analyzer_articles_question(articles_question_input) #incomplete
    if string.include? "pants"
      return answer = "pants"
    end
end

def articles_question
  sleep(1)
  puts "What kind of clothes are we looking for?"
  articles_question_input = gets.chomp
end
