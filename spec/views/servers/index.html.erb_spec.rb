require 'rails_helper'

RSpec.describe "servers/index", :type => :view do
  before(:each) do
    assign(:servers, [
      Server.create!(
        :name => "Name"
      ),
      Server.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of servers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
