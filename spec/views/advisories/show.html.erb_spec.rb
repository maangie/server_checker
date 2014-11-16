require 'rails_helper'

RSpec.describe 'advisories/show', type: :view do
  before(:each) do
    @advisory = FactoryGirl.create(:advisory)
    @server = @advisory.server
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/www.example.com/)
    expect(rendered).to match(/Email/)
  end
end
