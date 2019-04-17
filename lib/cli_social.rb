class SocialCli
  def self.random_five
    meetup_api = JSON.parse(RestClient.get('https://api.meetup.com/2/concierge?key=2f673325f5b422527f3d7e1c683f&sign=true&photo-host=public&country=United States&city=New York City&category_id=34'))
    results = meetup_api['results']
    system 'clear'
    puts "Here's what's happening around you in tech:\n\n"
    counter = 0
    5.times do
      num = rand(0...25)
      counter += 1
      meetup_name = results[num]['name']
      meetup_venue = results[num]['venue']['name']
      meetup_description = results[num]['description'].tr('/', '').slice!(3, 300)
      # meetup_description_length = results[num]["description"].length
      # characters_left = meetup_description_length - 303
      meetup_url = results[num]['event_url']
      puts "#{counter}. " + '🔹  ' + meetup_name + ' 🔹' + "\n ➡️ What: " + meetup_description + '(...)' + "\n ➡️ Where: " + meetup_venue + "\n ➡️ RSVP: " + meetup_url + "\n\n"
    end
  end

  def self.after_meetups(user)
    prompt = TTY::Prompt.new
    nav = prompt.select('What do you want to do next?', %w[More Back])
    if nav == 'More'
      SocialCli.random_five
    else
      user.category_search_page
    end
  end

  def self.go(user)
    SocialCli.random_five
    SocialCli.after_meetups(user)
  end
end
