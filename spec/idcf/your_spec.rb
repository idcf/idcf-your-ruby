# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Your API test' do
  it 'ライブラリバージョンがセットされているか' do
    expect(Idcf::Your::VERSION).not_to be nil
  end
end
