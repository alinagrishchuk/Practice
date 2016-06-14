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
        transition :open => :shipped
      end

    end
end
