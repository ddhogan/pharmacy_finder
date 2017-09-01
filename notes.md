To Do:
1. Prevent it from breaking with invalid zipcode entries. It can sometimes be difficult to tell when a zipcode is invalid...
2. Refactor the scraping and the stores into two different objects?
3. Add a second or third store?  Why can't two finish when either one by themselves would?
4. Sort the list by distance


# Dummy data
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

	# [store_1, store_2, store_3]

Target (none of this works)
	# def self.scrape_target
	# 	doc ||= Nokogiri::HTML(open("https://www.target.com/store-locator/find-stores?address=#{PharmacyFinder::CLI.zipcode}"))		
		
	# 	target ||= self.new
	# 	binding.pry
	# 	target.name ||= doc.xpath("//*[@id="store-2530"]/h3/text()").first.text.strip
	# 	target.address ||= doc.search(".link link-grayDarkest link-underline").first.text.strip
		
	# 	target.hours ||= doc.search("p.h-text-greenDark").first.text.strip
	# 	target.phone ||= doc.search("a.link.link-grayDarkest.link-underline").first.text.strip.
	# 	target.url ||= "https://www.target.com/store-locator/find-stores?address=#{PharmacyFinder::CLI.zipcode}"
	# 	target
	# end