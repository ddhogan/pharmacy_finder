# the CLI controller

class PharmacyFinder::CLI
	attr_accessor :stores, :zipcode
	@@zipcode = nil
	
	def call
		puts <<-DOC
---------------------------
Welcome to Pharmacy Finder!
Please enter your 5 digit US zip code:
---------------------------
		DOC
		zipcode
		PharmacyFinder::Store.scrape_stores(@@zipcode)
		list_stores
		menu
		goodbye
	end

	def zipcode

		@@zipcode = gets.strip
	end

	def list_stores
		@stores = PharmacyFinder::Store.all
		puts ""
		puts "Here is your nearest drugstore of a certain popular chain:"
		@stores.each.with_index(1) do |store, i|
			puts "#{i}. #{store.name} - #{store.address} - is #{store.distance} away."
			puts ""
		end
	end

	def menu
		choice = nil
		while choice != "exit"
			puts "Select a location to get more info (or you can type list or exit):"
			choice = gets.strip.downcase
			
			if choice.to_i > 0 && choice.to_i <= @stores.size
				my_store = @stores[choice.to_i-1]
				puts "    #{my_store.name} - #{my_store.address} - #{my_store.distance}"
				puts "        #{my_store.hours}"
				puts "        Tel: #{my_store.phone}"
				puts "        #{my_store.url}"
			elsif choice == "list"
				list_stores
			else
				puts "Please try again, or type list or exit." unless choice == "exit"
			end
		end
	end

	def goodbye
		puts "Thank you for using Pharmacy Finder!"
	end
end