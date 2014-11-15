class Invoice
  require 'bigdecimal'

  attr_accessor :state, :subtotal, :sales_tax, :service_fee

  def initialize(args = {})
    @subtotal = args[:subtotal]
  end

  def sales_tax
    SalesTax.new(@state, @subtotal).dollar_amount
  end

  def service_fee
    @subtotal / 0.8 - @subtotal
  end

  def total
    @subtotal + sales_tax + service_fee
  end



end

class SalesTax
  def initialize(state, subtotal)
    @state = state
    @subtotal = subtotal
  end

  def dollar_amount
    case @state
    when "CA"
      return @subtotal * 0.1
    when "FL"
      return @subtotal * BigDecimal('0.07')
    end
  end

end