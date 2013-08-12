module Social
	class Image < ActiveRecord::Base
		
		belongs_to :parent, polymorphic: true
		attr_accessible :asset
		has_attached_file :asset, styles: { square: "700x500#" }
		
		validates :asset, presence: true
		validates :parent, presence: true
		
	end
end
