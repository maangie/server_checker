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

RSpec.describe ServersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Server. As you add validations to Server, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'www.example.com' }
  end

  let(:invalid_attributes) do
    { name: ' ' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ServersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all servers as @servers' do
      server = Server.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:servers)).to eq([server])
    end
  end

  describe 'GET show' do
    it 'assigns the requested server as @server' do
      server = Server.create! valid_attributes
      get :show, { id: server.to_param }, valid_session
      expect(assigns(:server)).to eq(server)
    end
  end

  describe 'GET new' do
    it 'assigns a new server as @server' do
      get :new, {}, valid_session
      expect(assigns(:server)).to be_a_new(Server)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested server as @server' do
      server = Server.create! valid_attributes
      get :edit, { id: server.to_param }, valid_session
      expect(assigns(:server)).to eq(server)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Server' do
        expect do
          post :create, { server: valid_attributes }, valid_session
        end.to change(Server, :count).by(1)
      end

      it 'assigns a newly created server as @server' do
        post :create, { server: valid_attributes }, valid_session
        expect(assigns(:server)).to be_a(Server)
        expect(assigns(:server)).to be_persisted
      end

      it 'redirects to the created server' do
        post :create, { server: valid_attributes }, valid_session
        expect(response).to redirect_to(Server.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved server as @server' do
        post :create, { server: invalid_attributes }, valid_session
        expect(assigns(:server)).to be_a_new(Server)
      end

      it "re-renders the 'new' template" do
        post :create, { server: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { name: 'news.example.com' }
      end

      let(:server)  { Server.create! valid_attributes }
      let(:server_id) { server.to_param }

      it 'updates the requested server' do
        put :update, { id: server_id, server: new_attributes }, valid_session
        server.reload
        expect(assigns(:server).name).to eq new_attributes[:name]
      end

      it 'assigns the requested server as @server' do
        put :update, { id: server_id, server: valid_attributes }, valid_session
        expect(assigns(:server)).to eq(server)
      end

      it 'redirects to the server' do
        put :update, { id: server_id, server: valid_attributes }, valid_session
        expect(response).to redirect_to(server)
      end
    end

    describe 'with invalid params' do
      let(:server) { Server.create! valid_attributes }
      let(:params) { { id: server.to_param, server: invalid_attributes } }

      it 'assigns the server as @server' do
        put :update, params, valid_session
        expect(assigns(:server)).to eq(server)
      end

      it "re-renders the 'edit' template" do
        put :update, params, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested server' do
      server = Server.create! valid_attributes
      expect do
        delete :destroy, { id: server.to_param }, valid_session
      end.to change(Server, :count).by(-1)
    end

    it 'redirects to the servers list' do
      server = Server.create! valid_attributes
      delete :destroy, { id: server.to_param }, valid_session
      expect(response).to redirect_to(servers_url)
    end
  end
end
