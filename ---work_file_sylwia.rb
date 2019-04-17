require 'Pry'
require 'rest-client'
require 'json'
require 'net/http'
require 'TTY-prompt'

####################################### MEETUP API #################################

class SocialCli

  def self.random_five
    meetup_api = JSON.parse(RestClient.get("https://api.meetup.com/2/concierge?key=2f673325f5b422527f3d7e1c683f&sign=true&photo-host=public&country=United States&city=New York City&category_id=34"))
    results = meetup_api["results"]
    system 'clear'
    puts "Here's what's happening around you in tech:\n\n"
    counter = 0
    random_five = 5.times do
      num = rand(0...25)
      counter += 1
      meetup_name = results[num]["name"]
      meetup_venue = results[num]["venue"]["name"]
      meetup_description = results[num]["description"].tr('/', '').slice!(3,300)
      meetup_description_length = results[num]["description"].length
      characters_left = meetup_description_length - 303
      meetup_url = results[num]["event_url"]
      puts "#{counter}. " + "🔹  " + meetup_name + " 🔹" + "\n ➡️ What: " + meetup_description + "(...)"+ "\n ➡️ Where: " + meetup_venue + "\n ➡️ RSVP: " + meetup_url + "\n\n"
    end
  end

  def self.after_meetups
    prompt = TTY::Prompt.new
    nav = prompt.select('What do you want to do next?', %w(More Back))
    if nav == "More"
      SocialCli.random_five
    else
      category_search_page
    end
  end

  def self.go
    SocialCli.random_five
    SocialCli.after_meetups
  end

    # binding.pry
  end

  # binding.pry

  ####################################### WELLNESS - ADDED FUN #################################

  see file: banana_man.rb
  connected it with cli_wellness (line: 233, 242-243)

  ####################################### CAREER SEED DATA #################################

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

####################################### COMMENT ON USER.RB #################################
->>>>>>>>>>>>>>>>>>>> take out save_or_back

def save_or_back
  choice = prompt.select('', %w[Save Back])
  save_tip(tip) if choice == 'Save'
  category_tips(nav)
end

def save_or_back_or_read
  prompt.select('', %w[Save Browser Back])
  if choice == 'Save'
    save_tip(tip)
  elsif choice == 'Browser'
    system("open -a Safari #{tip.url}")
  else
  category_tips(nav)
end

->>>>>>>>>>>>>>>>>>>> lines 138-147 , (def chosen_tip)

puts "🔹 " + tip.title + " 🔹\n"
puts tip.content.to_s + "\n"
puts "Here's how to do that: " + tip.howto
  if tip.url == nil
    save_or_back
  else
    save_or_back_or_read
  end
end

  ####################################### WELLNESS DATA #################################

  It would be cool to scrape each item so that we can add "how to"

  ####################################### NOT IMPORTANT #################################
  #this API displays events that are tech and in nyc
  # this is how data displays
  # => {"results"=>
      #   [{"utc_offset"=>-14400000,
      #     "venue"=>
        #      {"country"=>"us",
        #       "localized_country_name"=>"USA",
        #       "city"=>"New York",
        #       "address_1"=>"11 Broadway, Suite 260",
        #       "name"=>"The Flatiron School ",
        #       "lon"=>-74.014267,
        #       "id"=>20079042,
        #       "state"=>"NY",
        #       "lat"=>40.705284,
        #       "repinned"=>false},
      #     "headcount"=>0,
      #     "visibility"=>"public",
      #     "waitlist_count"=>0,
      #     "created"=>1515079870000,
      #     "maybe_rsvp_count"=>0,
      #     "description"=>
      #      "<p>Four budding developer pairs from our web development program will present for 5-10 minutes on a technical topic of
      #  their choice.</p> <p>This Meetup is a great opportunity for prospective students to visit the school, meet current students
      #  and teachers, and catch a glimpse of The Flatiron School experience. Also a terrific chance for prospective employers to me
      # et our students early in the semester!</p> <p>6:15pm: Introduce yourself and settle in!</p> <p>6:30pm-8:00pm: Student presen
      # tations in Turing, located on the main campus.</p> <p>-------------------------------------------------------------------</p
      # > <p>RESOURCES FOR PROSPECTIVE STUDENTS:</p> <p>Admissions process: <a href=\"https://www.quora.com/How-can-I-best-prepare-f
      # or-Flatiron-Schools-admissions-process\" class=\"linkified\">https://www.quora.com/How-can-I-best-prepare-for-Flatiron-Schoo
      # ls-admissions-process</a></p> <p>Reapplication process: <a href=\"https://www.quora.com/Has-anyone-reapplied-to-Flatiron-Sch
      # ool-and-been-accepted\" class=\"linkified\">https://www.quora.com/Has-anyone-reapplied-to-Flatiron-School-and-been-accepted<
      # /a></p> <p>Student reviews: <a href=\"https://www.quora.com/Reviews-of-Flatiron-School\" class=\"linkified\">https://www.quo
      # ra.com/Reviews-of-Flatiron-School</a></p> <p>-------------------------------------------------------------------</p> <p>See
      # you there!</p>",
      #     "how_to_find_us"=>
