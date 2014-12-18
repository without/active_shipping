module ActiveMerchant
  module Shipping
    module InternationalDocuments
      class InvoiceItem
        attr_accessor :description, :quantity, :unit_code, :unit_value, :part_number, :country_of_origin

        def initialize(description, quantity, unit_of_measurement, unit_code, unit_value, part_number, country_of_origin)
          self.description = description
          self.quantity = quantity
          self.unit_code = unit_code
          self.unit_value = unit_value
          self.part_number = part_number
          self.country_of_origin = country_of_origin
        end
      end

      class Invoice
        attr_accessor :currency_code, :number, :date, :po_number, :reason_for_export, :declaration

        def self.form_type
          '01'
        end

        def initialize(currency_code, number, date, po_number, reason_for_export, declaration)
          self.currency_code = currency_code
          self.number = number
          self.date = date
          self.po_number = po_number
          self.reason_for_export = reason_for_export
          self.declaration = declaration
        end

        def items
          @items ||= []
        end
      end
    end
  end
end
