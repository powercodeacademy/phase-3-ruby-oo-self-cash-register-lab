require "pry"

class CashRegister
  attr_reader :discount, :items

  attr_accessor :total, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    quantity.times { @items << title }
    @total += price * quantity
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount > 0
      discount_amount = @total * (@discount / 100.0)
      @total -= discount_amount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items(*args)
    add_item(*args) if args.any?
    @items
  end

  def void_last_transaction
    if @last_transaction && @last_transaction > 0
      self.total -= last_transaction
      self.last_transaction
    end
    total
  end
end
