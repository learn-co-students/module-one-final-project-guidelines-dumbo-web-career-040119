require 'open-uri'
require 'nokogiri'
require 'pry'

def available_tips
  html = open("https://ggia.berkeley.edu/")
  doc = Nokogiri::HTML(html)
  tips = doc.css(".article__content")
  all_tips = []
  while all_tips.length < 20 do
    all_tips = tips.each do |tip|
      puts "Option: " + tip.css("h4").text
      puts "Explanation:" + tip.css("p").text
    end
  end
end




# instructors = doc.css("#instructors .team-holder .person-box")
# instructors.each do |instructor|
#   puts "Flatiron School <3 " + instructor.css("h2").text
# end

# featured_wellness_tips_title = berkley_website.css("#title .article__head").text
