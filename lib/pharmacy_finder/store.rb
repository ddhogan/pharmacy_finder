class PharmacyFinder::Store
	attr_accessor :name, :address, :distance, :hours, :phone, :url

	@@all = []

	def self.all
		@@all
	end

	def self.scrape_stores
		self.all << self.scrape_riteaid
		self.all << self.scrape_cvs

		self.all
	end

	def self.scrape_riteaid
		doc = Nokogiri::HTML(open("https://locations.riteaid.com/locations/search.html?q=03857"))
		
		riteaid = self.new
		riteaid.name = doc.search("h4.location-title").first.text.strip
		riteaid.address = doc.search(".c-address-street-1").first.text.strip
		riteaid.distance = doc.search(".map-it-distance").first.text.strip
		riteaid.hours = doc.search(".location-info-hours-pharmacy").first.text.strip # ok, but need to fix the formatting here
		riteaid.phone = doc.search(".location-info-phone .visible-xs").first.text.strip
		riteaid.url = doc.search("a.location-title-link").first.attr("href").strip
		
		riteaid
	end

	def self.scrape_cvs
		doc = Nokogiri::HTML(open("https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=03857"))		
		
		cvs = self.new
		
		cvs.name = "CVS"
		cvs.name = doc.search(".address-link").first.text.strip.gsub("\t","").gsub("\r", "")
		cvs.distance = doc.search(".distance-miles").first.text.strip.gsub("\t","").gsub("\n", "").gsub("\r","")
		cvs.hours = doc.search(".store_alert_hidden")[1].text.strip
		cvs.phone = doc.search("a.tel_phone_number").first.text.strip.gsub("\r", "").gsub("\t","").gsub("\n","").gsub("Contact number","")
		cvs.url = doc.search(".address-link").first.attr("href").strip
		
		cvs
	end
end