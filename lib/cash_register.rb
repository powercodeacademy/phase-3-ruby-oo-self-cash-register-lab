class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    self.total = total + (price * quantity)
    @last_transaction = price * quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      self.total = total - (total * (discount / 100.0))
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def void_last_transaction
    self.total = total - @last_transaction
  end
end