class RubyTips

  def self.google_seach(user)
    prompt = TTY::Prompt.new
    query = prompt.ask("What Ruby topic would you like to search?")
    html = open("https://www.google.com/search?q=Ruby #{query}")
    doc = Nokogiri::HTML(html)

    link_and_description = doc.search(".g")


    new_tip = Tip.create()

    new_tip.name = link_and_description.first.search('h3').text
    new_tip.content = link_and_description.first.search('.s').css('span').text
    new_tip.category = "Ruby"
    new_tip.save!
    user.save_tip_from_search(new_tip)
  end


  def self.ruby_nav(user)
    prompt = TTY::Prompt.new
    nav = prompt.select("We have some great Ruby Tips! You can also search for more.", %w(Tips Search Back))
    if nav == 'Tips'
      user.category_tips('Ruby')
    elsif nav == 'Search'
      google_seach(user)
    else
      user.category_search_page
    end
  end

end
