class ProductType < ActiveRecord::Base
  has_many :products, inverse_of: :product_type
end
