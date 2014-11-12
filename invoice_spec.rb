require 'rspec'
require_relative 'invoice.rb'

describe Invoice, '#sales_tax' do
  describe 'in California' do
    let(:invoice) { Invoice.new subtotal: 100, state: 'CA' }
    it { expect(invoice.sales_tax).to eq 10 }
  end

  describe 'in Florida' do
    let(:invoice) { Invoice.new subtotal: 100, state: 'FL' }
    it { expect(invoice.sales_tax).to eq 7 }
  end
end

describe Invoice, '#service_fee' do
  describe 'when subtotal is less than $5000' do
    let(:invoice) { Invoice.new subtotal: 100, state: 'CA' }
    it { expect(invoice.service_fee).to eq 25 }
  end

  describe 'when subtotal is at least $5000' do
    let(:invoice) { Invoice.new subtotal: 5000, state: 'CA' }
    it { expect(invoice.service_fee).to eq 5000 }
  end
end

describe Invoice, '#total' do
  let(:invoice) { Invoice.new subtotal: 100, state: 'CA' }
  it { expect(invoice.total).to eq 135 }
end
