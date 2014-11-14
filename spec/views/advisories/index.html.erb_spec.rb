require 'rails_helper'

RSpec.describe 'advisories/index', type: :view do
  before(:each) do
    assign(:advisories, [
      Advisory.create!(
        server: nil,
        email: 'Email'
      ),
      Advisory.create!(
        server: nil,
        email: 'Email'
      )
    ])
  end

  it 'renders a list of advisories' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
  end
end
