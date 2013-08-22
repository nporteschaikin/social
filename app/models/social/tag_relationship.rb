module Social
  class TagRelationship < ActiveRecord::Base
    
    attr_accessible :tag
    belongs_to :tag
    belongs_to :post
    validates :tag_id, presence: true, uniqueness: { scope: :post_id }
    
  end
end
