# frozen_string_literal: true

require 'spec_helper'

describe 'Billing API unit test' do
  let!(:stub_connection) do
    stubs
  end

  let(:client) do
    client = Idcf::Your::Client.new api_key: ('A' * 86), secret_key: ('A' * 86)
    allow(client).to receive(:connection).and_return(stub_connection)
    client
  end

  context '支払い履歴' do
    example '取得できるか' do
      expect(client.list_billing_history.body['data']).not_to be nil
      expect(client.get('billings/history').body['data']).not_to be nil
    end

    example 'bodyの取得' do
      expect(client.list_billing_history.resources).not_to be nil
      expect(client.get('billings/history').resources).not_to be nil
    end

    example 'uuidの取得' do
      expect(client.list_billing_history.uuid).to be nil
      expect(client.get('billings/history').uuid).to be nil
    end
  end

  context '支払い詳細' do
    example '取得できるか' do
      expect(client.list_billing_detail('2017-07').body['data']).not_to be nil
      expect(client.get('billings/2017-07').body['data']).not_to be nil
    end

    example 'bodyの取得' do
      expect(client.list_billing_detail('2017-07').resources).not_to be nil
      expect(client.get('billings/2017-07').resources).not_to be nil
    end

    example 'uuidの取得' do
      expect(client.list_billing_detail('2017-07').uuid).to be nil
      expect(client.get('billings/2017-07').uuid).to be nil
    end

    example '日付が未来の場合エラーが帰るか' do
      expect { client.list_billing_detail('2017-08') }.to raise_error(
        Idcf::Your::ApiError
      )
    end

    example '間違えた値が入力された場合エラーが帰るか' do
      expect { client.list_billing_detail('error') }.to raise_error(
        Idcf::Your::ApiError
      )
    end
  end
end
