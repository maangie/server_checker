require 'rails_helper'

RSpec.describe 'servers/show', type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(name: 'www.example.com'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
  end
end
