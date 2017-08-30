# the CLI controller

class PharmacyFinder::CLI
	def call
		puts <<-DOC
	---------------------------
	Welcome to Pharmacy Finder!
	Here are your local drugstores:
	---------------------------
		DOC
		list_locations
		menu
		goodbye
	end

	def list_locations
		@locations = PharmacyFinder::Store.all
	end

	def menu
		choice = nil
		while choice != "exit"
			puts "Select a location to get more info (or you can type list or exit):"
			choice = gets.strip.downcase
			case choice
			when "1"
				puts "More info about location 1"
			when "2"
				puts "More info about location 2"
			when "3"
				puts "More info about location 3"
			when "list"
				list_locations
			else
				puts "Please try again, or type list or exit."
			end
		end
	end

	def goodbye
		puts "Thank you for using Pharmacy Finder!"
	end
end