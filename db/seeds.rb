Directory.destroy_all
Tip.destroy_all
User.destroy_all

Tip.create(
  name: "Golden Rule",
  category: "Ruby",
  title: "Use pry, don’t cry.",
  content: "Although pry may seem a little counter-intuitive (“why would I stop my process to use pry?!?“), it will really save you a lot of trouble if you pry often.",
  how_to: "Remember to put pry outside a method and INSIDE it as well - otherwise, pry may not work",
  url: "https://tinyurl.com/y5cffgd5",
  user_created: "false"
)

Tip.create(
  name: "Errors",
  category: "Ruby",
  title: "Errors are your friends.",
  url: "https://ruby-doc.org/core-2.2.0/Exception.html",
  content: "An error is nothing else than a Ruby version of open communication and constructive feedback. It tells you where it hurts!",
  how_to: "\n Don’t freak out when you see the error. Just read it. And then again. \n Things to pay attention to: \n - check the file name and the line number, like here:'./lib/ruby_tips.rb:9';\n - check the error type, like here: '(NameError)';\n - check both in your code and if that doesn't help - google!",
  user_created: "false"
)

Tip.create(
  name: "A variable has no name",
  category: "Ruby",
  title: "Name your variables and name them right.",
  content: "Simple as that: if you name your variables right, debugging and refactoring will be easy-peasy. ",
  how_to: "Be descriptive (but not overly) so that your future self will exactly know where to look for what. \n Pssst. remember that class variables have an @ sign in their name, while the instance variables don't.",
  url: "https://tinyurl.com/y6ludg3o",
  user_created: "false"
)

Tip.create(
  name: "And you, what's your datatype?",
  category: "Ruby",
  title: "Make sure you know what datatype are your variables (and arguments).",
  content: "Imagine debugging for an hour just to later learn that the variable you passed in a method as an argument is a string and ",
  how_to: "Call a variable with .class method (for instance: puppies_array.class) - this will tell you everything.",
  user_created: "false"
)

Tip.create(
  name: "Hash me outside",
  category: "Ruby",
  title: "Don't iterate over hashes. What for? Just split them into arrays 🙄.",
  user_created: "false"
)

Tip.create(
  name: "Floating around",
  category: "Ruby",
  title: "Remember to float when you do maths.",
  content: "If you're getting errors on your equations, try to float the integer.",
  how_to: ".to_f is your method!",
  url: "http://ruby.bastardsbook.com/chapters/numbers/",
  user_created: "false"
)

Tip.create(
  name: "Single Source of Truth",
  category: "Ruby",
  title: "I will tell the truth, the whole truth and nothing but the truth.",
  content: "When designing your domain in OO Ruby, make sure that every piece of data is saved JUST ONCE in ONE place. Other places may use this data but it should live only in one place. Otherwise you'll spend hours debugging.",
  how_to: "Use whiteboard A LOT, mark all the relations and try to challenge your assumptions.",
  url: "https://tinyurl.com/y4wb2dc7",
  user_created: "false"
)

Tip.create(
  name: "Select vs map vs find vs each",
  category: "Ruby",
  title: "There's a method in this madness.",
  content: "Sometimes it may be diffcult to choose which of the Fantastic Four (map, select, find, each) to use.",
  how_to: `1. Are you trying to choose a few elements out of an array? Select or map may be your choice (see next steps). \n1a. Do you have any kind of comparison (e.g. name == "XYZ")? If so, you wanna use select. \n1b. If not and/or you just want to get a specific part of a given instance (e.g. 'show only names'), then map. \n2. Are you looking for the first thing that fulfills some condition? Go with find. \n3. If any of the above satisfies you, if you're not getting the result you wanna or if you're just lazy, resort to each (though remember that it shows poor character)`,
  url: "https://tinyurl.com/y3ywcuob",
  user_created: "false"
)

def wellness_tips
  html = open("https://ggia.berkeley.edu/")
  doc = Nokogiri::HTML(html)
  tips = doc.search(".article__content") #selects 12 tips

  tips.map.with_index do |tip, index|
    new_tip = Tip.create() #create a new Tip instance
    new_tip.name = tip.css('h4').text
    new_tip.content = tip.css('p').text
    new_tip.url = doc.search(".article__actions").css('a').attr('href').text
    new_tip.category = "Wellness"
    new_tip.user_created = false
    new_tip.save!
  end

  Tip.destroy_all(name: "")
end

wellness_tips


Tip.create(
  name: "Getting job interviews in tech.",
  category: "Career",
  title: "I spent 3 months applying to jobs after a coding bootcamp. Here’s what I learned.",
  content: "A less-talked about part of the bootcamper’s journey is what happens after you graduate — when you’re searching for that six-figure developer position.",
  url: "https://tinyurl.com/y85k467h",
  user_created: "false"
)

Tip.create(
  name: "Getting a job in 4 months.",
  category: "Career",
  title: "How to Get Your First Developer Job in 4 Months.",
  content: "I got my first developer job after 4 months of learning web development. It was lot of hard work but this is how I did it.",
  url: "https://tinyurl.com/y685wgfv",
  user_created: "false"
)

Tip.create(
  name: "Coding challenges for the future.",
  category: "Career",
  title: "Your new hobby.",
  url: "https://codewars.com",
  user_created: "false"
)

Tip.create(
  name: "Women in Tech",
  category: "Career",
  title: "Women in Tech: Software Engineer Career Advice.",
  content: "Is it really a man’s world when it comes to software engineering? Glancing around a Java uni lecture or checking out the engineering department at an old school software house might feel like you’ve just stepped into a secret men’s club.",
  url: "https://tinyurl.com/y433md22",
  user_created: "false"
)

Tip.create(
  name: "Barriers to getting a job after a coding bootcamp.",
  category: "Career",
  title: "Women in Tech: Software Engineer Career Advice.",
  content: "What about that 22% bootcamp graduates who don’t have jobs?",
  url: "https://tinyurl.com/yy554hgy",
  user_created: "false"
)

Tip.create(
  name: "How to get a job after a coding bootcamp.",
  category: "Career",
  title: "How to get a job after a coding bootcamp.",
  content: "Getting a tech job after a coding bootcamp is very possible, but not necessarily pain-free.",
  url: "https://tinyurl.com/y4qyhkev",
  user_created: "false"
)

Tip.create(
  name: "Lessons I learned the first year after completing a coding bootcamp.",
  category: "Career",
  title: "Lessons I learned the first year after completing a coding bootcamp.",
  content: "the resources that have helped me become a better programmer since.",
  url: "https://tinyurl.com/y56go9ps",
  user_created: "false"
)


# def ruby_tips
#   html = open("https://launchschool.com/books/ruby/read/arrays")
#   doc = Nokogiri::HTML(html)
#   tips = doc.css("h3")
#   binding.pry
#
#   tips.map.with_index do |tip, index|
#     counter = 0
#     new_tip = Tip.create() #create a new Tip instance
#     new_tip.name = tip.css('h3').text
#
#     new_tip.content = tip.css('p').text
#     new_tip.category = "Ruby"
#     new_tip.save!
#   end
# end
#
# ruby_tips
# RubyTips.scraping_method_for_name.each do |tip|
#   tip.create(name: name, category: "Ruby")
# end
