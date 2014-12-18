require 'test_helper'

class InvoiceTest < Test::Unit::TestCase
  def test_invoice
    invoice = ActiveMerchant::Shipping::InternationalForms::Invoice.new()
  end
end
