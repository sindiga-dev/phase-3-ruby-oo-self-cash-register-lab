
# CashRegister .new takes one optional argument, an employee discount, on initialization
 # CashRegister .new sets an instance variable @total on initialization to zero
    # CashRegister .new optionally takes an employee discount on initialization
    # CashRegister #total returns the current total
    # CashRegister #add_item accepts a title and a price and increases the total
    # CashRegister #add_item also accepts an optional quantity
    # CashRegister #add_item doesn't forget about the previous total
    # CashRegister #apply_discount the cash register was initialized with an employee discount
    # CashRegister #apply_discount applies the discount to the total price
    # CashRegister #apply_discount returns success message with updated total
    # CashRegister #apply_discount reduces the total
    # CashRegister #items returns an array containing all items that have been added
    # CashRegister #void_last_transaction subtracts the last item from the total
    # CashRegister #void_last_transaction returns the total to 0.0 if all items have been removed
    
    
    class CashRegister
      attr_accessor :total, :discount, :items, :last_transaction
    
      def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
      end
    
      def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do
          items << title
        end
        self.last_transaction = price * quantity
      end
    
      def apply_discount
        if discount != 0
          self.total = (total * ((100.0 - discount.to_f)/100)).to_i
          "After the discount, the total comes to $#{self.total}."
        else
          "There is no discount to apply."
        end
      end
    
      def void_last_transaction
        self.total = self.total - self.last_transaction
      end
    end