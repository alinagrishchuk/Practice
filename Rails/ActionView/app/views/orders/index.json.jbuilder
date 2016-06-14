json.array!(@orders) do |order|
  json.extract! order, :id, :order_number, :card_last_four, :amount, :credit_card_number, :credit_card_expires_on
  json.url order_url(order, format: :json)
end
