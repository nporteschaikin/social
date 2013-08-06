module Social
	class Import < ActiveRecord::Base
		
		serialize :networks
		
		before_save do
			self.networks = []
			self.class.networks.each do |m|; self.networks.push(m.to_s) if m.import; end
		end
		
		class << self
			
			def networks
				[Social::Posts::TumblrPost, Social::Posts::FacebookPost, Social::Posts::Instagram, Social::Posts::Tweet]
			end
			
		end
		
	end
end
