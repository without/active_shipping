require 'active_shipping/shipping/international_forms/invoice'
module ActiveMerchant
  module Shipping
    module InternationalForms
      class <<self
        def all
          [Invoice]
        end
      end
    end
  end
end
