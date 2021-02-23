require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items
    def initialize(emp_disc = 0)
      @total = 0.0
      @discount = emp_disc
      @items = []
      @transaction_list = {}
    end

    def add_item(title, price, quantity=1)
        @total += (price)*quantity
        quantity.times {@items << title}
        @transaction_list[@transaction_list.keys.length+1] ||= price
    end

    def apply_discount
        @total *= (100-@discount)/100.to_f
        if @discount == 0
            message = "There is no discount to apply."
        else
            message = "After the discount, the total comes to $#{@total.to_i}."
        end
        message
    end     

    def void_last_transaction
        @total -= @transaction_list[@transaction_list.keys.last]
        @transaction_list.delete(@transaction_list.keys.last)
        if @transaction_list.empty? 
            @total = 0.0
        end
    end 
end 
