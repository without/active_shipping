module ActiveMerchant
  module Shipping
    module InternationalForms
      UNITS_OF_MEASUREMENT = [
        :barrel, :bundle, :bag, :bunch, :box, :bolt, :butt, :canister,
        :centimeter, :container, :crate, :case, :carton, :cylinder,
        :dozen, :each, :envelope, :feet, :kilogram, :kilograms, :pound,
        :pounds, :liter, :meter, :number, :packet, :pallet, :piece,
        :pieces, :proof_liters, :package, :pair, :pairs, :roll, :set,
        :square_meters, :square_yards, :tube, :yard, :other
      ]

      class TypeException < Exception
        def initialize(expected, actual)
          super "Type mismatch: #{expected.name} expected but found #{actual.class.name}"
        end
      end

      class UnitException < Exception
        def initialize(unit_code)
          super "Unrecognized unit code: #{unit_code.inspect}"
        end
      end

      class InvoiceItem
        attr_accessor :description, :quantity, :unit_code, :unit_value, :part_number, :country_of_origin

        def initialize(description, quantity, unit_code, unit_value, part_number, country_of_origin)
          self.description = description
          self.quantity = quantity
          raise UnitException.new(unit_code) unless UNITS_OF_MEASUREMENT.include?(unit_code)
          self.unit_code = unit_code
          self.unit_value = unit_value
          self.part_number = part_number
          self.country_of_origin = country_of_origin
        end
      end

      class Invoice
        attr_accessor :currency_code, :date, :sold_to, :reason_for_export, :declaration, :number, :po_number

        def self.form_type
          '01'
        end

        def initialize(currency_code, date, sold_to, reason_for_export, declaration, options = {})
          self.currency_code = currency_code
          self.date = date
          raise TypeException.new(Location, sold_to) unless sold_to.is_a? Location
          self.sold_to = sold_to
          self.reason_for_export = reason_for_export
          self.declaration = declaration
          self.number = options[:number]
          self.po_number = options[:po_number]
        end

        def items
          @items ||= []
        end
      end
    end
  end
end
