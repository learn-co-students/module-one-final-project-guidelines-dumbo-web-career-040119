Directory.destroy_all
Tip.destroy_all
User.destroy_all

Tip.create(
  name: "Golden Rule",
  category: "Ruby",
  title: "Use pry, don’t cry.",
  content: "Although pry may seem a little counter-intuitive (“why would I stop my process to use pry?!?“), it will really save you a lot of trouble if you pry often."
)

Tip.create(
  name: "Errors",
  category: "Ruby",
  title: "Errors are your friends.",
  content: "An error is nothing else than a Ruby version of open communication and constructive feedback. It tells you where it hurts! Don’t freak out when you see the error. Just read it. And then again."
)

def wellness_tips
  html = open("https://ggia.berkeley.edu/")
  doc = Nokogiri::HTML(html)
  tips = doc.search(".article__content") #selects 12 tips

  tips.map.with_index do |tip, index|
    new_tip = Tip.create() #create a new Tip instance
    new_tip.name = tip.css('h4').text
    new_tip.content = tip.css('p').text
    new_tip.category = "Wellness"
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
  url: "https://tinyurl.com/y85k467h"
)

Tip.create(
  name: "Getting a job in 4 months.",
  category: "Career",
  title: "How to Get Your First Developer Job in 4 Months.",
  content: "I got my first developer job after 4 months of learning web development. It was lot of hard work but this is how I did it.",
  url: "https://tinyurl.com/y685wgfv"
)

Tip.create(
  name: "Coding challenges for the future.",
  category: "Career",
  title: "Your new hobby.",
  url: "https://codewars.com"
)

Tip.create(
  name: "Women in Tech",
  category: "Career",
  title: "Women in Tech: Software Engineer Career Advice.",
  content: "Is it really a man’s world when it comes to software engineering? Glancing around a Java uni lecture or checking out the engineering department at an old school software house might feel like you’ve just stepped into a secret men’s club.",
  url: "https://tinyurl.com/y433md22"
)

Tip.create(
  name: "Barriers to getting a job after a coding bootcamp.",
  category: "Career",
  title: "Women in Tech: Software Engineer Career Advice.",
  content: "What about that 22% bootcamp graduates who don’t have jobs?",
  url: "https://tinyurl.com/yy554hgy"
)

Tip.create(
  name: "How to get a job after a coding bootcamp.",
  category: "Career",
  title: "How to get a job after a coding bootcamp.",
  content: "Getting a tech job after a coding bootcamp is very possible, but not necessarily pain-free.",
  url: "https://tinyurl.com/y4qyhkev"
)

Tip.create(
  name: "Lessons I learned the first year after completing a coding bootcamp.",
  category: "Career",
  title: "Lessons I learned the first year after completing a coding bootcamp.",
  content: "the resources that have helped me become a better programmer since.",
  url: "https://tinyurl.com/y56go9ps"
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
