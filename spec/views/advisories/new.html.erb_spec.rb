require 'rails_helper'

RSpec.describe 'advisories/new', type: :view do
  before(:each) do
    @server = FactoryGirl.create(:server)
    assign(:advisory, @server.advisory.build(email: 'MyString'))
  end

  it 'renders new advisory form' do
    render

    path = server_advisories_path(@server)
    assert_select 'form[action=?][method=?]', path, 'post' do
      assert_select 'input#advisory_server_id[name=?]', 'advisory[server_id]'
      assert_select 'input#advisory_email[name=?]', 'advisory[email]'
    end
  end
end
