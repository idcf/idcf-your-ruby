# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'faraday-cookie_jar'
require 'idcf/faraday_middleware'

module Idcf
  module Your
    # Your API Client
    class Client
      include ClientExtensions::Billing

      attr_reader :api_key, :secret_key, :host, :endpoint, :verify_ssl

      def initialize(api_key:, secret_key:, host: 'your.idcfcloud.com',
                     endpoint: '/api/v1', verify_ssl: true)
        @api_key    = api_key
        @secret_key = secret_key
        @host       = host
        @endpoint   = endpoint
        @verify_ssl = verify_ssl
        Faraday::Request.register_middleware(
          signature: Idcf::FaradayMiddleware::Signature
        )
      end

      def connection
        @connection ||=
          Faraday.new(url: url_prefix, ssl: ssl_options) do |faraday|
            faraday.request :json
            faraday.request :signature, api_key: api_key, secret_key: secret_key
            faraday.response :json
            faraday.use :cookie_jar
            faraday.adapter Faraday.default_adapter
          end
      end

      def get(resource, parameters = {}, headers = {})
        send 'get', resource, parameters, headers
      end

      def get!(resource, parameters = {}, headers = {})
        send! 'get', resource, parameters, headers
      end

      private

      def send(method, resource, parameters = {}, headers = {})
        Request.new(self, method, resource, parameters, headers).send
      end

      def send!(method, resource, parameters = {}, headers = {})
        response = send(method, resource, parameters, headers)
        unless response.success?
          raise(
            ApiError,
            "HTTP status code: #{response.status}, " \
            "Error message: #{response.message}, " \
            "Reference: #{response.reference}"
          )
        end
        response
      end

      def ssl_options
        { verify: verify_ssl }
      end

      def url_prefix
        "https://#{host}"
      end
    end
  end
end
