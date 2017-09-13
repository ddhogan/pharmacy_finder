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
		self.scrape_riteaid(zipcode)
		self.scrape_cvs(zipcode)
	end

	def self.scrape_riteaid(zipcode)
		doc ||= Nokogiri::HTML(open("https://locations.riteaid.com/locations/search.html?q=#{zipcode}"))
		doc.search(".location-list-result.js-location-result")[0..4].each do |riteaid|
			store ||= self.new
			store.name ||= riteaid.search("h4.location-title").text.strip
			store.address ||= riteaid.search(".c-address-street-1").text.strip
			
			distance_holder ||= riteaid.search(".map-it-distance").text.strip
			# removes the repeated part from distance
			store.distance ||= distance_holder[0..(distance_holder.size)/2-1]

			# hours needs work for legibility
			store.hours ||= riteaid.search('div.location-info-hours-mobile-wrap').text.gsub("DayMonTueWedThursFriSatSunPharmacyDay of the Week", "").gsub("Hours", "Hours ").gsub("y", "y ").gsub("PM", "PM, ").strip.chop

			store.phone ||= riteaid.search(".location-info-phone .visible-xs").text.strip
			store.url ||= "https://locations.riteaid.com" + riteaid.search("a.location-title-link").attr("href").value.gsub("..","")
		end
	end

	def self.scrape_cvs(zipcode)
		doc ||= Nokogiri::HTML(open("https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=#{zipcode}"))		
		doc.search(".searchResult")[0..4].each do |cvs|
			store ||= self.new
			store.name = "CVS"
			store.address ||= cvs.search(".address-link").text.strip.gsub("\t","").gsub("\r", "").gsub("\n", " ").gsub("dummy text", "")
			store.distance ||= cvs.search(".distance-miles").text.strip.gsub("mi", " mi").gsub("\t","").gsub("\n", "").gsub("\r","")
			store.hours ||= cvs.search(".store_alert_hidden")[1].text.strip
			store.phone ||= cvs.search("a.tel_phone_number").text.strip.gsub("\r", "").gsub("\t","").gsub("\n","").gsub("Contact number","")
			store.url ||= "https://www.cvs.com" + cvs.search(".address-link").attr("href").value
		end
	end
end