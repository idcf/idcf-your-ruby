# frozen_string_literal: true

module Idcf
  module Your
    # This module includes SDK API methods for Client.
    module ClientExtensions
      extend ActiveSupport::Autoload
      autoload :Billing, 'idcf/your/client_extensions/billing'
    end
  end
end
