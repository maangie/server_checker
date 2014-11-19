require 'rails_helper'

RSpec.describe 'servers/show', type: :view do
  before(:each) do
    @server = FactoryGirl.create(:server)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match /Name/
    expect(rendered).to match /Status/
  end
end
