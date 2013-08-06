module Social
	module Posts
		module Facebook
			
			class << self
				def table_name_prefix; "social_facebook_"; end
			end
			
		end
	end
end