require 'rspec'
require_relative 'invoice.rb'

describe Invoice do
  let(:invoice) { Invoice.new subtotal: 100 }

  before { invoice.state = 'CA' }

  describe '#subtotal' do
    it { expect(invoice.subtotal).to eq 100 }
  end

  describe '#sales_tax' do
    xit 'is 10% in California' do
      expect(invoice.sales_tax).to eq 10
    end

    xit 'is 7% in Florida' do
      invoice.state = 'FL'
      expect(invoice.sales_tax).to eq 7
    end
  end

  describe '#service_fee' do
    xit 'is 20%' do
      expect(invoice.service_fee).to eq 25
    end
  end

  describe '#total' do
    xit 'includes sales tax and service fee' do
      expect(invoice.total).to eq 135
    end
  end
end
