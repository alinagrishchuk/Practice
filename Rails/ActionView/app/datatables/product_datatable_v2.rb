class ProductDatatableV2
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Product.count,
      iTotalDisplayRecords: total_entries,
      aaData: data
    }
  end

  private

    def data
      products.map do |product|
        [
          link_to(product.name, product),
          number_to_currency(product.price),
          product.category.name,
          product.released_on
        ]
      end
    end

    def products
      @products ||= fetch_products
    end

    def fetch_products
      products = Product.joins(:category).order("#{sort_column} #{sort_direction}")
      products = products.page(page).per_page(per_page)
      if params[:sSearch].present?
        products =  products.where("products.name like :search or categories.name like :search", search: "%#{params[:sSearch]}%")
      end
      products
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[name price categories.name released_on ]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end

    def total_entries
      products.count
    end
end