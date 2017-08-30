class PharmacyFinder::Store
	attr_accessor :name, :address, :distance, :hours, :phone, :url

	def self.all
	#returns a bunch of instances of Store
	# 	puts <<-DOC
	# 1. Rite Aid at 123 Exeter Rd.
	# 2. CVS at 5 West Rd.
	# 3. Target at 37 Portsmouth Dr.
	# 	DOC
	store_1 = self.new
	store_1.name = "Rite Aid"
	store_1.address = "123 Exeter Rd."
	store_1.distance = "2 mi."
	store_1.hours = "8am - 9pm"
	store_1.phone = "555-1234"
	store_1.url = "https://locations.riteaid.com/locations/search.html?q=03857"

	store_2 = self.new
	store_2.name = "CVS"
	store_2.address = "5 West Rd."
	store_2.distance = "5 mi."
	store_2.hours = "8am - 9pm"
	store_2.phone = "555-1236"
	store_2.url = "https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=03857"

	store_3 = self.new
	store_3.name = "Target"
	store_3.address = "37 Portsmouth Dr."
	store_3.distance = "7 mi."
	store_3.hours = "7am - 11pm"
	store_3.phone = "555-1238"
	store_3.url = "https://www.target.com/store-locator/find-stores?address=03857"

	[store_1, store_2, store_3]
	end

end