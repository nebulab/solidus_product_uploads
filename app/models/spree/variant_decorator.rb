Spree::Variant.class_eval do
  has_many :docs, :as => :viewable, :dependent => :destroy
end
