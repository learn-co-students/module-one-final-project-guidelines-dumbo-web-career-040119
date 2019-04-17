class RubysFantasticFour

  def self.display_methods
    table_data = [
    {:method => "select", :use => "Use it if you answer YES to both questions:"},
    {:method => " ", :use => " 1. Are you trying to choose a few elements out of an array?,"},
    {:method => " ", :use => " 2. Do you have any kind of comparison (e.g. name == 'XYZ')?"},
    {:method => "map", :use => "Use it if you answer YES to both questions:"},
    {:method => " ", :use => " 1. Is there no comparison?"},
    {:method => " ", :use => " 2.Are you just want to get an attr. of a given instance?"},
    {:method => "find", :use => "Use it to find the 1st thing that fulfills some condition."},
    {:method => "each", :use => "Use when nothing else works or when you're feeling lazy."}]
    # {:method => "map", :use => "Use it if you answer YES to both questions: \n 1. Are you trying to choose a few elements out of an array?, \n 2. Is there no comparison and/or you just want to get \na specific part of a given instance (e.g. 'show only names')?"},
    # {:method => "find", :use => "Use it if you are looking for the first thing that fulfills some condition?"}
    # {:method => "each", :use => "Use it if you are not getting the result you wanna or if you're just lazy, \n resort to each (though remember that it shows poor character)"}

    Formatador.display_table(table_data)
  end

  def self.after_table(user)
    prompt = TTY::Prompt.new
    nav = prompt.select('', %w(Back))
    if nav == "Back"
      user.category_search_page
    end
  end

  def self.go(user)
    system 'clear'
    # system "artii RUBY'S FANTASTIC FOUR | red"
    sleep 1
    puts "\n🔹 Here's the most important thing we learned: 🔹 \n\nYou have to nail Ruby's Fantastic Four methods."
    sleep 1
    RubysFantasticFour.display_methods
    RubysFantasticFour.after_table(user)
  end

end
