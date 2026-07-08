class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount = 0.0)
    @discount = discount
    @total = 0.00
    @items = []
    @last_transaction = {}
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      items.push(title)
      self.total += price
      self.total  = self.total.round(2)
    end
    @last_transaction = {
      title: title,
      price: price,
      quantity: quantity,
    }
  end

  def apply_discount
    return "There is no discount to apply." if discount.zero?

    self.total = total * (1 - (discount / 100.0))
    "After the discount, the total comes to $#{total.floor}."
  end

  def void_last_transaction
    @last_transaction => { price:, quantity: }

    items.pop(quantity)
    self.total -= (price * quantity)
  end
end
