require 'pry'
require 'rest-client'
require 'json'
require 'net/http'
require 'tty-prompt'
require 'open-uri'
require 'nokogiri'

  class WellnessCli

    # https://www.wikihow.com/Meditate-on-Breath

############################# BREATHING METHODS ############################################################
    def self.invite_for_breathing
      puts "\n 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n"
      puts "Stress is real." #some bla bla bla
      sleep 2
      puts "One of the ways to tackle it is through intentional breathing."
      sleep 2
      puts "We invite you to do a simple exercise."
      sleep 2
      puts "Follow our guidance."
      sleep 2
      puts "You'll inhale for 4 seconds through your nose."
      sleep 2
      puts "Then you'll hold your breath for 7 seconds."
      sleep 2
      puts "Finally, you'll exhale for 8 seconds through your mouth."
      sleep 2
      puts "Repeat 5 times." #we can ask how many times to repeat
      puts "\n 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n "
    end

    # def self.invite_for_breathing #version for accessibility
    #   system("say -v samantha 'Stress is'")
    #   system("say -v samantha 'We invite you to a simple breathing exercise. Breathe in for 4 seconds through your nose, hold your breath for 7 seconds, exhale for 8 seconds through your mouth. Repeat 5 times. Follow my voice.'")
    # end
    #

    #   def self.breathing_circle
    #      4.times do
    #       system("say -v samantha -r 100 ' Breathe in'")
    #       sleep 4
    #       system("say -v samantha -r 100 'Hold it in'")
    #       sleep 7
    #      system("say -v samantha -r 100 'Breathe out'")
    #       sleep 8
    #      system("say -v samantha -r 100 'Repeat'")
    #     end
    #     system("say -v samantha -r 100 'Breathe in'")
    #       sleep 4
    #       system("say -v samantha -r 100 'Hold it in'")
    #       sleep 7
    #      system("say -v samantha -r 100 'Breathe out'")
    #       sleep 8
    #      system("say -v samantha 'Great job!'")
    #           binding.pry
    #   end
    #
    # def self.breathe_in
    #   circle = "●"
    #   43.times do #3,55s.
    #     puts circle
    #     sleep(0.09)
    #     circle += "●"
    #   end
    # end

    def self.breathe_in
      circles = "🔹●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
      80.times do
        puts circles
        new_circles = circles.insert(0, "●")
        new_circles.slice!(new_circles.length-1,new_circles.length)
        circles = new_circles
        sleep(0.06)
        system 'clear'
      end
    end

    def self.hold_breath
      puts "                     🔹  7 🔹"
      sleep 1.08
      puts "                     🔹  6 🔹"
      sleep 1.08
      puts "                     🔹  5 🔹"
      sleep 1.08
      puts "                     🔹  4 🔹"
      sleep 1.08
      puts "                     🔹  3 🔹"
      sleep 1.08
      puts "                     🔹  2 🔹"
      sleep 1.08
      puts "                     🔹  1 🔹"
      sleep 1.08
    end

    def self.breathe_out
      circles = "●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●🔹"
      80.times do
        system 'clear'
        puts circles
        new_circles = circles << "●"
        new_circles.slice!(0, 1)
        circles = new_circles
        sleep(0.09)
        system 'clear'
      end
    end

    #
    # def self.hold_breath
    #   puts "● 7 ●"
    #   sleep 1.08
    #   puts "● 6 ●"
    #   sleep 1.08
    #   puts "● 5 ●"
    #   sleep 1.08
    #   puts "● 4 ●"
    #   sleep 1.08
    #   puts "● 3 ●"
    #   sleep 1.08
    #   puts "● 2 ●"
    #   sleep 1.08
    #   puts "● 1 ●"
    #   sleep 1.08
    # end
    #
    # def self.breathe_out
    #   circles = "●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
    #   51.times do
    #     puts circles
    #     sleep(0.15) #we can slow it down
    #     circles.slice!(0, 1)
    #   end
    # end
    #
    def self.breathing_circle(user)
      counter = 5
      5.times do #we can ask how many times repeat
        puts "\n\n                    🔹 INHALE 🔹\n\n"
        sleep 1
        WellnessCli.breathe_in
        puts "\n\n                    🔹 HOLD IN 🔹\n\n"
        sleep 1
        WellnessCli.hold_breath
        puts "\n\n                    🔹 EXHALE 🔹\n\n"
        sleep 1
        WellnessCli.breathe_out
        counter -= 1
        if counter == 1
          puts "\n\n             🔹🔹🔹 One last time. 🔹🔹🔹"
        else
          "\n\n             🔹🔹🔹 #{counter} TIMES MORE 🔹🔹🔹"
        end
      end
      puts "Great job!"
      WellnessCli.go(user)
    end


    def self.breathing
      #we could ask how many times they want to repeat or for how many minutes they want to breathe but if they're in panic?
      #I remember Graham say something about that time in Ruby is funny - divided by 8?
      WellnessCli.invite_for_breathing
      sleep 1
      WellnessCli.breathing_circle(user)
      #next step
    end

    ############################# QUOTES ############################################################

      def self.get_inspirational_quote(user)
        inspiration_api = JSON.parse(RestClient.get("http://quotes.rest/qod.json?category=inspire"))
        quote = inspiration_api["contents"]["quotes"][0]["quote"]
        author = inspiration_api["contents"]["quotes"][0]["author"]
        puts "\n\n                                 🔹 🔹 🔹                                       \n\n"
        printed_quote = "Here is your inspirational quote for today: \n\n '#{quote}'" +  "\n\n                               (#{author})"
        puts "\n\n                                 🔹 🔹 🔹                                       \n\n"
        prompt = TTY::Prompt.new
        nav = prompt.select(printed_quote, %w(Back))
        if nav == "Back"
          WellnessCli.go(user)
        end
              # system("say -v samantha '#{quote} #{author}'") #version for accessibility
      end

      def self.get_management_quote(user)
        # binding.pry
        management_api = JSON.parse(RestClient.get("http://quotes.rest/qod.json?category=management"))
        quote = management_api["contents"]["quotes"][0]["quote"]
        author = management_api["contents"]["quotes"][0]["author"]
        puts "\n\n                                 🔹 🔹 🔹                                       \n\n"
        printed_quote = "Here is your management quote for today: \n\n '#{quote}'" +  "\n                            (#{author})"
        puts "\n\n                                 🔹 🔹 🔹                                       \n\n"
        prompt = TTY::Prompt.new
        nav = prompt.select(printed_quote, %w(Back))
        if nav == "Back"
          WellnessCli.go(user)
        end
        # system("say -v samantha '#{quote} #{author}'") version for accessibility
      end


      ############################# TIPS ############################################################
      ###This data has been seeded instead, find this method in the seed file
      # def self.scrape_tips
      #     list = []
      #
      #     html = open("https://ggia.berkeley.edu/")
      #     doc = Nokogiri::HTML(html)
      #     tips = doc.search(".article__content") #selects 12 tips
      #
      #     tips.map.with_index do |tip, index|
      #         new_tip = Tip.new #create a new Tip instance
      #         new_tip.title = tip.css('h4').text
      #         new_tip.content = tip.css('p').text
      #         # new_tip.content = tip.attr("href")
      #         # list[index] = new_tip
      #     end
      #     #
      #     # list.sort_by! {|obj| BY WHAT}
      #     list
      # end

      ############################# EVERYTHING TOGETHER #############################################

    def self.wellness_options(user)
      # breathing = "Breathing exercise"
      # inspiration = "Inspirational quote of today"
      # management = "Management quote of today"
      # tips = "Bootcamp wellness tips"
      # back = "Back"
      prompt = TTY::Prompt.new
      nav = prompt.select("What are you interested in?", %w(Breathing Inspiration Management Tips Fun Back))
      if nav == "Breathing"
        WellnessCli.breathing(user)
      elsif nav == "Inspiration"
        WellnessCli.get_inspirational_quote(user)
      elsif nav == "Management"
        WellnessCli.get_management_quote(user)
      elsif nav == "Tips"
        user.category_tips('Wellness')
      elsif nav == "Fun"
        BananaMan.go(user)
      else
        user.category_search_page
      end
    end

    def self.go(user)
      wellness_options(user)
    end


  end
