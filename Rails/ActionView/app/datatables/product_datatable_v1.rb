class ProductDatatableV1 < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::WillPaginate


  def initialize(view)
    @view = view
  end

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['products.name', 'products.price']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['products.name']
  end

  private

  def data
    records.map do |product|
      [
        @view.link_to(product.name, product),
        @view.number_to_currency(product.price),
        product.category.name,
        product.released_on
      ]
    end
  end

  def get_raw_records
    # insert query here
    Product.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
