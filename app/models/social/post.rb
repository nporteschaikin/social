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
		
		def similar
		  self.class.joins(:tags).where(social_tags: {name: self.tags.collect{|x| x.name }}).where("social_posts.id != #{self.id}")
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
	      scoped.where(post_type: kls.to_s)
	    end
	    
	  end
		
	end
end
