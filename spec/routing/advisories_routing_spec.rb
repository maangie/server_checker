require 'rails_helper'

BASE = '/servers/1/advisories'

# /servers/1/advisories/xxx に対するマッチャ
RSpec::Matchers.define :route_to_advisories do |r|
  match do |actual|
    r[:id] = r[:id].to_s if r.has_key?(:id)
    expected = { controller: 'advisories', server_id: '1' }.merge(r)
    route_to(expected).matches?(actual)
  end
end

RSpec.describe AdvisoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: BASE).to route_to_advisories action: 'index'
    end

    it 'routes to #new' do
      expect(get: "#{BASE}/new").to route_to_advisories action: 'new'
    end

    it 'routes to #show' do
      expect(get: "#{BASE}/1").to route_to_advisories action: 'show', id: 1
    end

    it 'routes to #edit' do
      expect(get: "#{BASE}/1/edit").to route_to_advisories action: 'edit', id: 1
    end

    it 'routes to #create' do
      expect(post: BASE).to route_to_advisories action: 'create'
    end

    it 'routes to #update' do
      expect(put: "#{BASE}/1").to route_to_advisories action: 'update', id: 1
    end

    it 'routes to #destroy' do
      expect(delete: "#{BASE}/1").to route_to_advisories action: 'destroy',
                                                         id: 1
    end
  end
end
