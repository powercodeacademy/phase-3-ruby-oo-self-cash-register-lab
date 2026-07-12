class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
    @last_item_count = 0
  end

  def add_item(title, price, quantity = 1)
    quantity.times { @items << title }
    @last_transaction = price * quantity
    @last_item_count = quantity
    self.total += @last_transaction
  end

  def apply_discount
    return "There is no discount to apply." if @discount.zero?

    self.total = @total * (1 - @discount / 100.0)
    "After the discount, the total comes to $#{format_total(self.total)}."
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last_transaction
    @items.pop(@last_item_count)
    self.total = 0.0 if self.total.zero?
  end

  private

  def format_total(amount)
    amount.to_i == amount ? amount.to_i.to_s : amount.to_s
  end
end

