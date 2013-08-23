module Social
  class Tag < ActiveRecord::Base
    
    attr_accessible :name
    
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    has_many :tag_relationships, dependent: :destroy
    has_many :posts, through: :tag_relationships
    default_scope {includes(:tag_relationships)}
    
  end
end
