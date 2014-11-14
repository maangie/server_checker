require 'rails_helper'

RSpec.describe 'advisories/edit', type: :view do
  before(:each) do
    @advisory = FactoryGirl.create(:advisory)
    assign :advisory, @advisory
    assign :server, @advisory.server
  end

  it 'renders the edit advisory form' do
    render
    assert_select('form[action=?][method=?]',
                  server_advisory_path(@advisory.server, @advisory),
                  'post') do

      assert_select 'input#advisory_server_id[name=?]', 'advisory[server_id]'
      assert_select 'input#advisory_email[name=?]', 'advisory[email]'
    end
  end
end
