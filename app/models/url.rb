class Url < ActiveRecord::Base

	# validates :long_url, format: { with: /\A#{URI::regexp}\z/, message: "URL is wrong, try again."}
	# validates_presence_of :long_url , message: "Enter something different! "
	
	def shorten
    	self.short_url = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
 	end
end