class PharmacyFinder::Store
	attr_accessor :name, :address, :distance, :hours, :phone, :url

	@@all = []

	def initialize
		@@all << self
	end

	def self.all
		@@all
	end

	def self.scrape_stores(zipcode)
		# self.all << self.scrape_riteaid(zipcode)
		self.scrape_cvs(zipcode)
	end

### !!!If both locations are enabled at the same time, the app hangs on the scraping and never finishes.!!!

	def self.scrape_riteaid(zipcode)
		doc ||= Nokogiri::HTML(open("http://locations.riteaid.com/locations/search.html?q=#{zipcode}"))
		doc.each do |store|
			riteaid ||= self.new
			riteaid.name ||= doc.search("h4.location-title").text.strip
			riteaid.address ||= doc.search(".c-address-street-1").text.strip
			riteaid.distance ||= doc.search(".map-it-distance").text.strip
			riteaid.hours ||= "#{doc.search('.c-location-hours-today-day-hours-intervals-instance-open').text.strip}-#{doc.search('.c-location-hours-today-day-hours-intervals-instance-close').text.strip}"
			riteaid.phone ||= doc.search(".location-info-phone .visible-xs").text.strip
			riteaid.url ||= "https://locations.riteaid.com" + doc.search("a.location-title-link").attr("href").strip.gsub("..","")		
			riteaid
		end
	end

	def self.scrape_cvs(zipcode)
		# binding.pry
		doc ||= Nokogiri::HTML(open("https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=#{zipcode}"))		
		doc.search(".searchResult").each do |cvs|
			store ||= self.new
			store.name = "CVS"
			store.address ||= cvs.search(".address-link").text.strip.gsub("\t","").gsub("\r", "").gsub("\n", " ").gsub("dummy text", "")
			store.distance ||= cvs.search(".distance-miles").text.strip.gsub("\t","").gsub("\n", "").gsub("\r","")
			binding.pry
			store.hours ||= cvs.search(".store_alert_hidden")[1].text.strip
			store.phone ||= cvs.search("a.tel_phone_number").text.strip.gsub("\r", "").gsub("\t","").gsub("\n","").gsub("Contact number","")
			store.url ||= "https://www.cvs.com" + cvs.search(".address-link").attr("href").value
		end
		
	end
end