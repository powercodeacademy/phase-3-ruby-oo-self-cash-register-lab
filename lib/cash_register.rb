class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @items << title
    end

    @last_transaction = price * quantity
    self.total += @last_transaction
  end

  def apply_discount
    if discount.zero?
      "There is no discount to apply."
    else
      self.total -= total * (discount / 100.0)
      "After the discount, the total comes to $#{total.round}."
    end
  end

  def void_last_transaction
    self.total -= last_transaction

    self.total = 0.0 if total.negative?
  end
end
