require 'rails_helper'

RSpec.describe "advisories/new", :type => :view do
  before(:each) do
    assign(:advisory, Advisory.new(
      :server => nil,
      :email => "MyString"
    ))
  end

  it "renders new advisory form" do
    render

    assert_select "form[action=?][method=?]", advisories_path, "post" do

      assert_select "input#advisory_server_id[name=?]", "advisory[server_id]"

      assert_select "input#advisory_email[name=?]", "advisory[email]"
    end
  end
end
