# the CLI controller

class PharmacyFinder::CLI
	attr_accessor :stores
	
	def call
		puts <<-DOC
	---------------------------
	Welcome to Pharmacy Finder!
	Here are your local drugstores:
	---------------------------
		DOC
		list_stores
		menu
		goodbye
	end

	def list_stores
		@stores = PharmacyFinder::Store.scrape_stores
		@stores.each.with_index(1) do |store, i|
			puts "#{i}. #{store.name} - #{store.address} - is #{store.distance} away."
		end
	end

	def menu
		choice = nil
		while choice != "exit"
			puts "Select a location to get more info (or you can type list or exit):"
			choice = gets.strip.downcase
			
			if choice.to_i > 0
				my_store = @stores[choice.to_i-1]
				puts "    #{my_store.name} - #{my_store.address} - #{my_store.distance}"
				puts "      #{my_store.hours}, #{my_store.phone}"
				puts "      #{my_store.url}"
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