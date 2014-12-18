module ActiveMerchant #:nodoc:
  module Shipping
    # This is UPS specific for now; the hash is not at all generic
    # or common between carriers.

    class LabelResponse < Response
      attr :params # maybe?
      attr :shipment_id

      def initialize(success, message, params = {}, options = {})
        @params = params
        @shipment_id = params["ShipmentResults"]["ShipmentIdentificationNumber"]
        super
      end

      def labels
        return @labels if @labels
        packages = params["ShipmentResults"]["PackageResults"]
        packages = [packages] if Hash === packages
        @labels  = packages.map do |package|
          { :tracking_number => package["TrackingNumber"],
            :image           => package["LabelImage"] }
        end
      end
    end
  end
end
