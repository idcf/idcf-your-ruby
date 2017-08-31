# frozen_string_literal: true

module Idcf
  module Your
    # Send HTTP request
    class Request
      attr_reader :client, :method, :resource, :parameters, :headers

      # @private
      def initialize(client, method, resource, parameters, headers)
        @client       = client
        @method       = method
        @resource     = resource
        @parameters   = parameters
        @headers      = headers
      end

      # @private
      def send
        Response.new(
          client.connection.send(
            method,
            path,
            parameters,
            req_headers
          )
        )
      end

      private

      def req_headers
        ua = { 'User-Agent': "IDCF Your API Client v#{VERSION}" }
        ua.merge(headers)
      end

      def path
        "#{client.endpoint}/#{resource}"
      end
    end
  end
end
