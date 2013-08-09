module Social
	class Image < ActiveRecord::Base
		
		belongs_to :parent, polymorphic: true
		attr_accessible :asset
		has_attached_file :asset # to do: add styles
		
		validates :asset, presence: true
		validates :parent, presence: true
		
	end
end
