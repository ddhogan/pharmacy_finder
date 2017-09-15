class PharmacyFinder::Store
	attr_accessor :name, :address, :distance, :hours, :phone, :url

	@@all = []

	def initialize
		@@all << self
	end

	def self.all
		@@all
	end

	def self.sort_stores_by_distance
		self.all.sort do |a, b|
			a.distance.gsub("mi", "").strip.to_f <=> b.distance.gsub("mi", "").strip.to_f
		end
	end

end