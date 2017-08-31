# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext/class/attribute'
require 'active_support/dependencies/autoload'

require 'idcf/your/version'
require 'idcf/your/errors'

module Idcf
  # Your API Library
  module Your
    extend ActiveSupport::Autoload
    autoload :Client,           'idcf/your/client'
    autoload :ClientExtensions, 'idcf/your/client_extensions'
    autoload :Request,          'idcf/your/request'
    autoload :Response,         'idcf/your/response'
  end
end
