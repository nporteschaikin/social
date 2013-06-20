module Social
	class Engine < ::Rails::Engine
		isolate_namespace Social
		
		require 'koala'
		require 'twitter'
		require 'paperclip'
		
	end
end
