class Order < ActiveRecord::Base
  scope :open_orders, -> { with_state(:open) }
  scope :new_orders, -> { with_state(:incomplete) }

  state_machine  initial: :incomplete do

    event :purchase do
      transition :incomplete =>  :open
    end

    event :cancel do
      transition :open => :canceled
    end

    event :resume do
      transition :canceled => :open
    end

    event :ship do
      transition :open => :shippednene
    end

  end


  def self.total_grouped_by_day(start)
    orders = where(purchased_at: start.beginning_of_day..Time.zone.now)
    orders = orders.group('date(purchased_at)')
    orders = orders.select('purchased_at, sum(price) as total_price')
    orders.group_by { |o| o.purchased_at.to_date }
  end

end