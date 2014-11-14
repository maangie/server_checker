require 'rails_helper'

RSpec.describe 'servers/edit', type: :view do
  before(:each) do
    @server = assign(:server, Server.create!(
      name: 'MyString'
    ))
  end

  it 'renders the edit server form' do
    render
    assert_select 'form[action=?][method=?]', server_path(@server), 'post' do

      assert_select 'input#server_name[name=?]', 'server[name]'
    end
  end
end
