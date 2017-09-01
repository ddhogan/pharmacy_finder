class PharmacyFinder::Store
	attr_accessor :name, :address, :distance, :hours, :phone, :url

	@@all = []

	def self.all
		@@all ||= scrape_stores
	end

	def self.scrape_stores
		self.all << self.scrape_riteaid
		# self.all << self.scrape_cvs
		self.all
	end

### !!!If both locations are enabled at the same time, the app hangs on the scraping and never finishes.!!!

	def self.scrape_riteaid
		doc ||= Nokogiri::HTML(open("http://locations.riteaid.com/locations/search.html?q=#{PharmacyFinder::CLI.zipcode}"))
		# binding.pry
		riteaid ||= self.new
		riteaid.name ||= doc.search("h4.location-title").first.text.strip
		riteaid.address ||= doc.search(".c-address-street-1").first.text.strip
		riteaid.distance ||= doc.search(".map-it-distance").first.text.strip
		riteaid.hours ||= "#{doc.search('.c-location-hours-today-day-hours-intervals-instance-open').first.text.strip}-#{doc.search('.c-location-hours-today-day-hours-intervals-instance-close').first.text.strip}"
		riteaid.phone ||= doc.search(".location-info-phone .visible-xs").first.text.strip
		riteaid.url ||= "https://locations.riteaid.com" + doc.search("a.location-title-link").first.attr("href").strip.gsub("..","")
		riteaid
	end

	# def self.scrape_cvs
	# 	doc ||= Nokogiri::HTML(open("https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=#{PharmacyFinder::CLI.zipcode}"))		
	
	# 	cvs ||= self.new
	# 	cvs.name = "CVS"
	# 	cvs.address ||= doc.search(".address-link").first.text.strip.gsub("\t","").gsub("\r", "").gsub("\n", " ").gsub("dummy text", "")
	# 	cvs.distance ||= doc.search(".distance-miles").first.text.strip.gsub("\t","").gsub("\n", "").gsub("\r","")
	# 	cvs.hours ||= doc.search(".store_alert_hidden")[1].text.strip
	# 	cvs.phone ||= doc.search("a.tel_phone_number").first.text.strip.gsub("\r", "").gsub("\t","").gsub("\n","").gsub("Contact number","")
	# 	cvs.url ||= "https://www.cvs.com" + doc.search(".address-link").first.attr("href").strip
	# 	cvs
	# end
end