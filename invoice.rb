require 'bigdecimal'

class Invoice
  attr_accessor :subtotal, :state

  def initialize(subtotal:)
    @subtotal = subtotal
  end

  def sales_tax
    price.sales_tax
  end

  def service_fee
    price.service_fee
  end

  def total
    price.with_fees
  end

  private
  def price
    Price.new subtotal, state
  end
end

class Price
  attr_reader :amount, :state

  def initialize amount, state
    @amount = amount
    @state = state
  end

  def sales_tax
    SalesTax.new(state).for amount
  end

  def service_fee
    ServiceFee.new(state).for amount
  end

  def with_fees
    amount + sales_tax + service_fee
  end
end

class SalesTax
  def initialize state
    @state = state
  end

  def for amount
    case @state
    when 'CA' then BigDecimal('.1')
    when 'FL' then BigDecimal('.07')
    end * amount
  end
end

class ServiceFee
  def initialize state
    @state = state
  end

  def for amount
    amount / (1 - BigDecimal('.2')) - amount
  end
end
