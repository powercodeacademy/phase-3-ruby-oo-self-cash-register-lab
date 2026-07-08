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
    quantity.times { @items << title }
    @total += (price * quantity)
    @last_transaction = { title: title, price: price, quantity: quantity }
  end

  def apply_discount
    if discount > 0
      @total = total - (total * (discount / 100.0))
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    return if @last_transaction.empty?

    title = @last_transaction[:title]
    price = @last_transaction[:price]
    quantity = @last_transaction[:quantity]

    quantity.times { @items.delete_at(@items.index(title)) }
    @total -= (price * quantity)
    @last_transaction = {}
  end
end
