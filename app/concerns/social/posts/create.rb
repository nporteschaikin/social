module Social
  module Posts
    module Create
      
      extend ActiveSupport::Concern
      
      included do
        
        has_one :parent, as: :post, class_name: "Social::Post", dependent: :destroy
        default_scope { select("#{self.table_name}.*, #{Social::Post.table_name}.published_at, #{Social::Post.table_name}.address").joins(:parent) }
        attr_accessor :tags_found
        
        after_create do
          Social::Post.create post: self, published_at: self.published_at, address: self.address, tags_found: self.tags_found
        end
        
        def initialize(*args)
          [:published_at, :address].each {|x| self.class.send(:attr_accessor, x) }
          super
        end
        
      end
      
    end
  end
end