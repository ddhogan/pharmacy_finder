class PharmacyFinder::Store
	attr_accessor :name, :address, :distance, :hours, :phone, :url

	def self.all

	# store_1 = self.new
	# store_1.name = "Rite Aid"
	# store_1.address = "123 Exeter Rd."
	# store_1.distance = "2 mi."
	# store_1.hours = "8am - 9pm"
	# store_1.phone = "555-1234"
	# store_1.url = "https://locations.riteaid.com/locations/search.html?q=03857"

	# store_2 = self.new
	# store_2.name = "CVS"
	# store_2.address = "5 West Rd."
	# store_2.distance = "5 mi."
	# store_2.hours = "8am - 9pm"
	# store_2.phone = "555-1236"
	# store_2.url = "https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=03857"

	# store_3 = self.new
	# store_3.name = "Target"
	# store_3.address = "37 Portsmouth Dr."
	# store_3.distance = "7 mi."
	# store_3.hours = "7am - 11pm"
	# store_3.phone = "555-1238"
	# store_3.url = "https://www.target.com/store-locator/find-stores?address=03857"

	[store_1, store_2, store_3]
	end

	def self.scrape_stores
		stores = []
		stores << self.scrape_riteaid
		# stores << self.scrape_cvs
		# stores << self.scrape_target

		# go to the Rite Aid site, find the first location
		# extract properties
		# instantiate a Store object
		# push it into an array

		# go to CVS, do the same things, push to array

		# go to Target, do the same things, push to array
		stores
	end

	def self.scrape_riteaid
		doc = Nokogiri::HTML(open("https://locations.riteaid.com/locations/search.html?q=03857"))
		
		riteaid = self.new
		
		riteaid.name = doc.search("h4.location-title").first.text
		#binding.pry
		riteaid.address = doc.search(".c-address-street-1").first.text
		riteaid.distance = doc.search(".map-it-distance").first.text
		riteaid.hours = doc.search(".location-info-hours-pharmacy").first.text # ok, but need to fix the formatting here
		riteaid.phone = doc.search(".location-info-phone .visible-xs").first.text
		riteaid.url = doc.search("a.location-info-visit-link").first.attr("href")
		
		riteaid
	end

	def self.scrape_riteaid
		doc = Nokogiri::HTML(open("https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=03857"))
		binding.pry		
		# cvs = self.new
		
		# cvs.name = doc.search("").first.text
		# cvs.address = doc.search("").first.text
		# cvs.distance = doc.search("").first.text
		# cvs.hours = doc.search("").first.text
		# cvs.phone = doc.search("").first.text
		# cvs.url = doc.search("").first.attr("href")
		
		# cvs
	end
end