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
    assert_select 'h1', 'Advisories'
    assert_select 'h2', @server.name
    assert_select 'tr>td', text: 'foo@example.com', count: 2
  end
end
