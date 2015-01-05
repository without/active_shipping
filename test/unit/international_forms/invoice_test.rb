require 'test_helper'

class InvoiceTest < Test::Unit::TestCase
  def test_invoice
    sold_to = Location.new({
      country: 'CA',
      postal_code: 'H0H0H0',
      name: 'Santa Claus',
      address1: 'The North Pole',
      phone: '8883217654'
      })
    invoice = InternationalForms::Invoice.new 'CAD', Date.today, sold_to, 'sale', 'declaration', {number: 'number', po_number: 'PO'}
    invoice.items << InternationalForms::InvoiceItem.new('description', 1.234, :each, 6.99, 'sku', 'KE')
  end
end
