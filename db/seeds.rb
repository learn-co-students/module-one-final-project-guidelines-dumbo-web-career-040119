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
  binding.pry

  tips.map.with_index do |tip, index|
    new_tip = Tip.create() #create a new Tip instance
    new_tip.name = tip.css('h4').text
    new_tip.content = tip.css('p').text
    new_tip.category = "Wellness"
    new_tip.save!
    # binding.pry
    # list[index] = new_tip
    # new_tip.content = tip.attr("href")
    # list[index] = new_tip
  end
end

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
# wellness_tips
# ruby_tips
# RubyTips.scraping_method_for_name.each do |tip|
#   tip.create(name: name, category: "Ruby")
# end
