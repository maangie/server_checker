require 'rails_helper'

RSpec.describe 'advisories/show', type: :view do
  before(:each) do
    @server = FactoryGirl.create(:server)
    assign(:server, @server)
    assign(:advisory, @server.advisory.create(email: 'Email'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/www.example.com/)
    expect(rendered).to match(/Email/)
  end
end
