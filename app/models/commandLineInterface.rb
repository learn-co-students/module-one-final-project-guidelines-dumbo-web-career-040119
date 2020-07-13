class CommandLineInterface

  @@answer_array = []

  def getName
    system("clear")
    prompt = TTY::Prompt.new
    user_name = prompt.ask('What is your name?')
    @student = Student.create(name: user_name)
    puts "Hi, #{user_name}! Nice to meet you. Let's begin."
  end

  def exit
    puts "🔮 Things we lose have a way of coming back to us in the end, if not always in the way we expect. 🔮"
    return false
  end

  def greet
    system("clear")
    puts '🧙 Welcome to The Sorting House Quizzes, the best resource for Hogwarts info in the wizarding world! 🧙'
    prompt = TTY::Prompt.new
    input = prompt.select('Menu Items:') do |menu|
      menu.choice 'Begin Quiz', 1
      menu.choice 'Exit', 2
    end
    if input == 1
      self.getName
      return true
    elsif input == 2
      self.exit
    end
  end

  def startQuizAgain
    return true
  end

  def questionOne
    prompt = TTY::Prompt.new
    answer_1 = prompt.select('Four goblets are placed before you. Which do you drink?') do |menu|
      menu.choice 'A black, inky potion that gives off fumes that make you see strange visions.', 1
      menu.choice 'A thick potion that smells of plums and chocolate.', 2
      menu.choice 'A silvery, glittery potion that sparkles as if containing ground diamonds.', 3
      menu.choice 'The golden potion that gives off bright sunspots that dance around the room.', 4
    end
    @@answer_array << answer_1
  end

  def questionTwo
    prompt = TTY::Prompt.new
    answer_2 = prompt.select('You enter a room and see four items displayed on a table. You are allowed to take one with you, which do you choose?') do |menu|
      menu.choice 'An Old Diary', 3
      menu.choice 'A Unicorn Hair', 2
      menu.choice 'A Basilisk Fang', 1
      menu.choice 'A Phoenix Feather', 4
    end
    @@answer_array << answer_2
  end

  def questionThree
    prompt = TTY::Prompt.new
    answer_3 = prompt.select('During the end-of-year exams, you notice that one of your classmates was using an enchanted quill. You come top of the class anyway, but they are second. What do you do?') do |menu|
      menu.choice 'Tell the professor immediately, cheating is wrong no matter what.', 4
      menu.choice 'Nothing, but if I had not come top of the class, I would defintely tell the professor.', 3
      menu.choice 'Encourage the student to admit to the professor what they have done.', 2
      menu.choice 'Give them a high five for managing to sneak an enchanted quill into the exam.', 1
    end
    @@answer_array << answer_3
  end

  def questionFour
    prompt = TTY::Prompt.new
    answer_4 = prompt.select('You would be most hurt if a person called you...') do |menu|
      menu.choice 'Stupid', 3
      menu.choice 'Weak', 1
      menu.choice 'Scared', 4
      menu.choice 'Lazy', 2
    end
    @@answer_array << answer_4
  end

  def questionFive
    prompt = TTY::Prompt.new
    answer_5 = prompt.select('You are locked in a duel with a skilled opponent. They fire an unknown spell at you, and you shout…') do |menu|
      menu.choice 'Crucio', 1
      menu.choice 'Expelliarmus', 4
      menu.choice 'Protego', 3
      menu.choice 'Stupefy', 2
    end
    @@answer_array << answer_5
  end

  def questionSix
    prompt = TTY::Prompt.new
    answer_6 = prompt.select('Which of your skills are you most proud of?') do |menu|
      menu.choice 'My ability to get what I want.', 1
      menu.choice 'My ability to make new friends.', 2
      menu.choice 'My ability to absorb new information.', 3
      menu.choice 'My ability to face any problem that comes my way.', 4
    end
    @@answer_array << answer_6
  end

  def questionSeven
    prompt = TTY::Prompt.new
    answer_7 = prompt.select('Given the choice, would you rather invent a potion that would guarantee you:') do |menu|
      menu.choice 'Wisdom', 3
      menu.choice 'Power', 1
      menu.choice 'Glory', 4
      menu.choice 'Love', 2
    end
    @@answer_array << answer_7
  end

  def questionEight
    prompt = TTY::Prompt.new
    answer_8 = prompt.select('Which statement describes you best:') do |menu|
      menu.choice 'I would kill anyone for a friend.', 1
      menu.choice 'I appear as a helpful citizen but am secretly a mass murderer of people that hurt my friends.', 2
      menu.choice 'I would hide a dead body to save my friend from trouble.', 3
      menu.choice 'I would sacrifice myself in order to save a friend.', 4
    end
    @@answer_array << answer_8
  end

  def questionNine
    prompt = TTY::Prompt.new
    answer_9 = prompt.select('You are allowed a pet at Hogwarts: an owl, a cat, or a toad. Which do you bring?') do |menu|
      menu.choice 'Cat', 3
      menu.choice 'Toad', 2
      menu.choice 'Owl', 4
      menu.choice 'I DO NOT want a stupid pet!', 1
    end
    @@answer_array << answer_9
  end

  def questionTen
    prompt = TTY::Prompt.new
    answer_10 = prompt.select('Someone steals $20 from you, but they are very poor and need the money. How do you react?') do |menu|
      menu.choice 'Confront the person, beat them up, but let them keep the $20.', 2
      menu.choice 'Find the person, take your $20 back along with all their money, then throw them off a bridge.', 1
      menu.choice 'Let them keep the $20 and ask if there is anything else you can do to help.', 4
      menu.choice 'Secretly steal back your $20 and never tell anybody what happened.', 3
    end
    @@answer_array << answer_10
  end


  def assignHouse
    puts "The Sorting Hat is thinking..."
    sleep 3
    if @@answer_array.reduce(:+) >= 10 && @@answer_array.reduce(:+) <= 18
      slytherin = House.find_by(house_name: "Slytherin")
      Quiz.create(student_id: @student.id, house_id: slytherin.id)
      puts "Congratulations! You have been placed in Slytherin! 🐍🐍🐍"
    elsif @@answer_array.reduce(:+) >= 19 && @@answer_array.reduce(:+) <= 25
      hufflepuff = House.find_by(house_name: "Hufflepuff")
      Quiz.create(student_id: @student.id, house_id: hufflepuff.id)
      puts "Congratulations! You have been placed in Hufflepuff! 🦡🦡🦡"
    elsif @@answer_array.reduce(:+) >= 26 && @@answer_array.reduce(:+) <= 32
      ravenclaw = House.find_by(house_name: "Ravenclaw")
      Quiz.create(student_id: @student.id, house_id: ravenclaw.id)
      puts "Congratulations! You have been placed in Ravenclaw! 🦅🦅🦅"
    elsif @@answer_array.reduce(:+) >= 33 && @@answer_array.reduce(:+) <= 40
      gryffindor = House.find_by(house_name: "Gryffindor")
      Quiz.create(student_id: @student.id, house_id: gryffindor.id)
      puts "Congratulations! You have been placed in Gryffindor! 🦁🦁🦁"
    end
  end

  def secondMenu
    # Maybe use until loop?
    prompt = TTY::Prompt.new
    ans = prompt.select('What would you like to do now?') do |menu|
      menu.choice 'I am not happy with my house, I want to redo the quiz!', 1
      menu.choice 'View all of the houses I have been placed in through different quizzes.', 2
      menu.choice 'I am ashamed of the house I was put in, DELETE MY RESULTS!', 3
      menu.choice 'View all the students in Slytherin', 4
      menu.choice 'View all the students in Hufflepuff', 5
      menu.choice 'View all the students in Ravenclaw', 6
      menu.choice 'View all the students in Gryffindor', 7
      menu.choice 'Exit', 8
    end
    if ans == 1
      #Start the quiz over.
      self.startQuizAgain

    elsif ans == 2
      #View the different houses a specific student has been placed in.

    elsif ans == 3
      #Delete the last quiz.
      Quiz.last.delete

    elsif ans == 4
      #View all the students in Slytherin.
      quizzes = Quiz.where(house_id: House.find_by(house_name: "Slytherin").id)
      ids_from_quizzes = quizzes.map do |quiz|
        quiz.student_id
      end
      names = ids_from_quizzes.map do |num|
        Student.find_by(id: num).name
      end
      puts "#{names}"

    elsif ans == 5
      #View all the students in Hufflepuff.
      quizzes = Quiz.where(house_id: House.find_by(house_name: "Hufflepuff").id)
      ids_from_quizzes = quizzes.map do |quiz|
        quiz.student_id
      end
      names = ids_from_quizzes.map do |num|
        Student.find_by(id: num).name
      end
      puts "#{names}"

    elsif ans == 6
      #View all the students in Ravenclaw.
      quizzes = Quiz.where(house_id: House.find_by(house_name: "Ravenclaw").id)
      ids_from_quizzes = quizzes.map do |quiz|
        quiz.student_id
      end
      names = ids_from_quizzes.map do |num|
        Student.find_by(id: num).name
      end
      puts "#{names}"

    elsif ans == 7
      #View all the students in Gryffindor.
      quizzes = Quiz.where(house_id: House.find_by(house_name: "Gryffindor").id)
      ids_from_quizzes = quizzes.map do |quiz|
        quiz.student_id
      end
      names = ids_from_quizzes.map do |num|
        Student.find_by(id: num).name
      end
      puts "#{names}"

    elsif ans == 8
      #Exit.
      puts "🔮 Things we lose have a way of coming back to us in the end, if not always in the way we expect. 🔮"
      system("^C")
    end
  end

end

