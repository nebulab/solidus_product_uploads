Spree::Product.class_eval do
  has_many :documents, dependent: :destroy
end
