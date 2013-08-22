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
        
  		end

  	end
  end
end