require 'rails_helper'

RSpec.describe "advisories/show", :type => :view do
  before(:each) do
    @advisory = assign(:advisory, Advisory.create!(
      :server => nil,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Email/)
  end
end
