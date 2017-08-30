#doc = Nokogiri::HTML(open("https://locations.riteaid.com/locations/search.html?q=03857"))
doc = Nokogiri::HTML(open("https://www.walgreens.com/storelocator/find.jsp?tab=store+locator&requestid=03857"))
#doc = Nokogiri::HTML(open("https://www.cvs.com/store-locator/store-locator-landing.jsp?_requestid=03857"))



# CVS addresses: doc.search(".address-link").first.text.gsub("dummy text","").gsub("\t", "").gsub("\r","").gsub("\n", " ").strip
# Rite Aid address: doc.search("h4.location-title").first.text
# Walgreen's is dumb.