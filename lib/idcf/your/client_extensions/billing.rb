# frozen_string_literal: true

module Idcf
  module Your
    module ClientExtensions
      # For Billing API
      module Billing
        # List payment history.
        #
        # @param parameters [Hash] HTTP request query string
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        # @example
        #   response =
        #     client.list_payment_history(
        #       '2017-07'
        #     )
        #
        #   response.body #=>
        #   {
        #       "meta" => {
        #           "account_id" => "71000000000",
        #           "updated_at" => "2017-07-19T00:53:27+09:00"
        #       },
        #       "data" => [
        #           {
        #                        "month" => "2017-07",
        #               "billing_amount" => 58709,
        #               "payment_status" => 3
        #           },
        #           {
        #                        "month" => "2017-07",
        #               "billing_amount" => 58709,
        #               "payment_status" => 3
        #           }
        #       ]
        #   }
        #
        def list_billing_history(parameters = {}, headers = {})
          get! "/billings/history", parameters, headers
        end

        # List payment monthly detail.
        #
        # @param month [String] Settlement month (required)
        #   (YYYY-MM)
        # @param parameters [Hash] HTTP request query string
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        # @example
        #   response =
        #     client.list_payment_history(
        #       '2017-07'
        #     )
        #
        #   response.body #=>
        #     {
        #       "meta": {
        #         "account_id": "7100000000",
        #         "taxable_amount": 2791,
        #         "tax": 215,
        #         "total": 0,
        #         "updated_at": "2017-07-19T02:12:30+09:00",
        #         "billing_period_start_at": "2017-07-01",
        #         "billing_period_end_at": "2017-07-18",
        #         "invoice_no": null
        #       },
        #       "data": [{
        #         "Region": "jp-east",
        #         "ServiceName": "Cloud Computing",
        #         "ZoneName": "pascal",
        #         "Category": "VirtualMachine",
        #         "Menu": "light.S1",
        #         "ResourceDisplayName": "VM-6cfbf5b5-e7e1-44d8-aa5d-c3d8246d3",
        #         "StartDate": "2017-07-06",
        #         "EndDate": "2017-07-14",
        #         "Usage": 0.26277834177017,
        #         "Allocated": 184.31944513321,
        #         "Running": 0.26277834177017,
        #         "Stopped": 184.05666679144,
        #         "Amount": 0,
        #         "Tax": 0,
        #         "Net": 0
        #       },
        #       {
        #         "Region": "jp-east",
        #         "ServiceName": "Cloud Computing",
        #         "ZoneName": "pascal",
        #         "Category": "VirtualMachine",
        #         "Menu": "light.S1",
        #         "ResourceDisplayName": "VM-73e1df36-a9a3-4519-b40e-4679bf03e",
        #         "StartDate": "2017-07-06",
        #         "EndDate": "2017-07-14",
        #         "Usage": 184.09611105919,
        #         "Allocated": 184.18222308159,
        #         "Running": 184.09611105919,
        #         "Stopped": 0.086112022399902,
        #         "Amount": 73,
        #         "Tax": 5,
        #         "Net": 78
        #       }]
        #     }
        #
        def list_billing_detail(month, parameters = {}, headers = {})
          get! "/billings/#{month}", parameters, headers
        end
      end
    end
  end
end
