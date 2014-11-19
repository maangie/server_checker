# サーバ
class ServersController < ApplicationController
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
  end

  # GET /servers/new
  def new
    @server = Server.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  # POST /servers.json
  # TODO: advisories_controller を参考に短く
  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to @server, notice: t('notice.create_server') }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new }

        format.json do
          render json: @server.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to @server, notice: t('notice.update_server') }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit }

        format.json do
          render json: @server.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: t('notice.delete_server') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_server
    @server = Server.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the
  # white list through.
  def server_params
    params.require(:server).permit(:name)
  end
end
