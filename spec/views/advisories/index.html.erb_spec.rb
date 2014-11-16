require 'rails_helper'

RSpec.describe 'advisories/index', type: :view do
  before(:each) do
    @server = FactoryGirl.create(:server, id: 100_000)
    assign :server, @server

    FactoryGirl.create(:advisory, server: @server)
    FactoryGirl.create(:advisory, server: @server)
  end

  it 'renders a list of advisories' do
    render
    assert_select 'tr>td', text: @server.id.to_s, count: 2
    assert_select 'tr>td', text: 'foo@example.com', count: 2
  end
end
