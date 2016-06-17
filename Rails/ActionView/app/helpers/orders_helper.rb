module OrdersHelper
  def orders_chart_data(start = 5.weeks.ago)
    orders_by_date = Order.total_grouped_by_day(start)
    shipping_by_date = Order.where(shipping: true).total_grouped_by_day(start)
    download_by_date = Order.where(shipping: false).total_grouped_by_day(start)

    (3.weeks.ago.to_date..Date.today).map do |date|
      {
        purchased_at: date,
        price: orders_by_date[date].try(:first).try(:total_price) || 0,
        shipping_price: shipping_by_date[date].try(:first).try(:total_price) || 0,
        download_price: download_by_date[date].try(:first).try(:total_price) || 0
      }
    end
  end
end
