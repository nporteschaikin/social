module Social
	class Engine < ::Rails::Engine
		isolate_namespace Social
		
		config.autoload_paths += %W(#{config.root}/lib)
		
		require 'koala'
		require 'twitter'
		require 'instagram'
		require 'paperclip'
		require 'tumblr_client'
		# require 'protected_attributes' if Rails.version >= '4.0'
		
	end
end
