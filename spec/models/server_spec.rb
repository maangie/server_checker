require 'rails_helper'

RSpec.describe Server, type: :model do
  describe 'www.example.com' do
    let(:server) { FactoryGirl.create(:server, name: 'www.example.com') }
    specify { expect(server.status.code).to eq '200' }
    specify { expect(server.status.message).to eq 'OK' }
  end

  describe 'it.is.not.exist' do
    let (:server) { FactoryGirl.create(:server, name: 'it.is.not.exist') }
    specify { expect(server.status.code).to eq '200' }
  end
end
