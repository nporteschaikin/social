module Social
	class Post < ActiveRecord::Base
	
		attr_accessible :post, :published_at, :address
		include Tags::Relationship
		
		default_scope { includes(:post) }
		default_scope { order('published_at DESC') }
		belongs_to :post, polymorphic: true
		
		def network; self.post.class.network; end
		def snippet; self.post.snippet; end
		
		def photo
			return self.post.post.photo if defined?(self.post.post.photo)
			return self.post.photo if defined?(self.post.photo)
		end
		
	  class << self

	    def type(cls)
	      if cls.to_s =~ /(Social::Posts::)/
	        kls = cls
	      elsif cls.to_s =~ /(Posts::)/
	        kls = "Social::#{cls}"
	      elsif defined?("Posts::#{cls.to_s}")
	        kls = "Social::Posts::#{cls.to_s}"
	      end
	      where(post_type: kls.to_s)
	    end
	    
	    def popular_tags
	      unscoped.includes(:tags).collect {|x| x.tags }.flatten.group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)
	    end
	    
	  end
		
	end
end
