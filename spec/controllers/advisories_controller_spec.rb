require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe AdvisoriesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Advisory. As you add validations to Advisory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { email: 'foo@example.com' }
  end

  let(:invalid_attributes) do
    { email: 'foo@com' }
  end

  let(:server) { FactoryGirl.create(:server) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdvisoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all advisories as @advisories' do
      advisory = server.advisories.create valid_attributes
      get :index, { server_id: server.id }, valid_session
      expect(assigns(:advisories)).to eq([advisory])
    end
  end

  describe 'GET show' do
    it 'assigns the requested advisory as @advisory' do
      advisory = server.advisories.create valid_attributes
      get :show, { server_id: server.id, id: advisory.to_param }, valid_session
      expect(assigns(:advisory)).to eq(advisory)
    end
  end

  describe 'GET new' do
    it 'assigns a new advisory as @advisory' do
      get :new, { server_id: server.id }, valid_session
      expect(assigns(:advisory)).to be_a_new(Advisory)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested advisory as @advisory' do
      advisory = server.advisories.create valid_attributes
      get :edit, { server_id: server.id, id: advisory.to_param }, valid_session
      expect(assigns(:advisory)).to eq(advisory)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      let(:params) { { server_id: server.id, advisory: valid_attributes } }

      it 'creates a new Advisory' do
        expect do
          post :create, params, valid_session
        end.to change(Advisory, :count).by(1)
      end

      it 'assigns a newly created advisory as @advisory' do
        post :create, params, valid_session
        expect(assigns(:advisory)).to be_a(Advisory)
        expect(assigns(:advisory)).to be_persisted
      end

      it 'redirects to the created advisory' do
        post :create, params, valid_session
        path = "/servers/#{server.id}/advisories/#{server.advisories.last.id}"
        expect(response).to redirect_to path
      end
    end

    describe 'with invalid params' do
      let(:params) { { server_id: server.id, advisory: invalid_attributes } }

      it 'assigns a newly created but unsaved advisory as @advisory' do
        post :create, params, valid_session
        expect(assigns(:advisory)).to be_a_new(Advisory)
      end

      it "re-renders the 'new' template" do
        post :create, params, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { email: 'bar@example.com' }
      end

      it 'updates the requested advisory' do
        advisory = server.advisories.create valid_attributes

        params = {
          server_id: server.id,
          id: advisory.to_param,
          advisory: new_attributes
        }

        put :update, params, valid_session
        advisory.reload
        expect(assigns(:advisory).email).to eq new_attributes[:email]
      end

      it 'assigns the requested advisory as @advisory' do
        advisory = server.advisories.create valid_attributes

        params = {
          server_id: server.id,
          id: advisory.to_param,
          advisory: valid_attributes
        }

        put :update, params, valid_session
        expect(assigns(:advisory)).to eq(advisory)
      end

      it 'redirects to the advisory' do
        advisory = server.advisories.create valid_attributes

        params = {
          server_id: server.id,
          id: advisory.to_param,
          advisory: valid_attributes
        }

        put :update, params, valid_session
        path = "/servers/#{server.id}/advisories/#{server.advisories.last.id}"
        expect(response).to redirect_to(path)
      end
    end

    describe 'with invalid params' do
      let(:advisory) { server.advisories.create valid_attributes }

      let(:params) do
        {
          server_id: server.id,
          id: advisory.to_param,
          advisory: invalid_attributes
        }
      end

      it 'assigns the advisory as @advisory' do
        put :update, params, valid_session
        expect(assigns(:advisory)).to eq(advisory)
      end

      it "re-renders the 'edit' template" do
        put :update, params, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:advisory) { server.advisories.create valid_attributes }
    let!(:params) { { server_id: server.id, id: advisory.to_param } }

    it 'destroys the requested advisory' do
      expect do
        delete :destroy, params, valid_session
      end.to change(Advisory, :count).by(-1)
    end

    it 'redirects to the advisories list' do
      delete :destroy, params, valid_session
      expect(response).to redirect_to(server_advisories_url)
    end
  end

  describe 'メイル' do
    subject { response }

    describe 'サーバの状態を送信する' do
      let(:advisory) { server.advisories.create valid_attributes }

      before do
        get :send_server_status,
            { server_id: server.id, id: advisory.to_param }, valid_session
      end

      it { is_expected.to redirect_to(server_advisory_url(server, advisory)) }
    end

    describe 'サーバの状態を全ての報告先に送信する' do
      before do
        FactoryGirl.create(:advisory, server: server)
        FactoryGirl.create(:advisory, email: 'bar@example.com', server: server)

        get :send_server_status_to_advisories, { server_id: server.id },
            valid_session
      end

      it { is_expected.to redirect_to(server_advisories_url(server)) }
    end
  end
end
