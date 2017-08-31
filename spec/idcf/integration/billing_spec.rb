# frozen_string_literal: true

require 'spec_helper'

describe 'Billing API integration test' do
  let(:client) do
    Idcf::Your::Client.new(api_key: ('A' * 86), secret_key: ('A' * 86),
                           host: 'your.idcfcloud.com', verify_ssl: true)
  end

  context '結合テスト' do
    example '認証情報が不正な場合エラーが帰るか' do
      expect { client.list_billing_detail('error') }.to raise_error(
        Idcf::Your::ApiError
      )
    end
  end
end
