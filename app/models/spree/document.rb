class Spree::Document < ActiveRecord::Base
  belongs_to :products, class_name: "Spree::Product"
#  has_attached_file :pdf
#  validates_attachment_content_type :pdf, :content_type => "application/pdf"
end

