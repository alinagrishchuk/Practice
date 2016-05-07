class GoodnessValidator2
  def initialize(product)
    @product = product
  end

  def validate
    if @product.description && (@product.description.include? 'evil')
      @product.errors[:base] << 'This product is evil!'
    end
  end
end

class Product < ActiveRecord::Base
  belongs_to :product_type
  has_many :categories

  validates :product_type, presence: true
  validates :size, inclusion: {in: %w(small medium large),
    message: "%{value} is not a valid size"}, allow_nil: true
  validates :part_number, length: { in: 6..20 }
  validates :name, uniqueness: { scope: :size,
                                 message: "should happen once per size" }

  validates :price, numericality: true, on: :update
  validates :price, presence: true,
    unless: Proc.new { |a| a.size.blank? }

  validate do |product|
    GoodnessValidator2.new(product).validate
  end

  validates_each :name, :description do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
