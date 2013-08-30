module Social
  module Tags
  	module Relationship

  		extend ActiveSupport::Concern

  		included do
        has_many :tag_relationships, dependent: :destroy
        has_many :tags, through: :tag_relationships, source: :tag
        
        attr_accessible :tags_found
        attr_accessor :tags_found
        
        after_save do
          self.tags_found.each {|t| self.tag_relationships.create tag: Tag.find_or_create_by_name(t) } if self.tags_found.is_a? Array
        end
        
        class << self
          def tag(tag)
    	      joins(:tags).where(social_tags: {name: tag})
    	    end

    	    def popular_tags
    	      unscoped.includes(:tags).collect {|x| x.tags }.flatten.group_by{|x| x}.sort_by{|k, v| -v.size}.map(&:first)
    	    end
    	  end
  		end

  	end
  end
end