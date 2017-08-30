# the CLI controller

class PharmacyFinder::CLI
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
		@stores = PharmacyFinder::Store.all
		@stores.each.with_index(1) do |store, i|
			puts "#{i}. #{store.name} - #{store.address} - #{store.distance}"
		end
	end

	def menu
		choice = nil
		while choice != "exit"
			puts "Select a location to get more info (or you can type list or exit):"
			choice = gets.strip.downcase
			
			if choice.to_i > 0
				puts @stores[choice.to_i-1]
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