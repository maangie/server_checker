# 通知先
class AdvisoriesController < ApplicationController
  include ApplicationHelper
  include RenderHelper

  before_filter :load_advisory
  before_action :set_advisory,
                only: [:show, :edit, :update, :destroy, :send_server_status]

  # GET /advisories
  # GET /advisories.json
  def index
    @advisories = Advisory.all
  end

  # GET /advisories/1
  # GET /advisories/1.json
  def show
  end

  # GET /advisories/new
  def new
    @advisory = @server.advisories.build
  end

  # GET /advisories/1/edit
  def edit
  end

  # POST /advisories
  # POST /advisories.json
  def create
    @advisory = @server.advisories.build(advisory_params)

    @advisory.save || (render_unprocessable_entity(@advisory, :new) && return)

    respond_to do |format|
      format.html do
        redirect_to [@server, @advisory], notice: t('notice.create_advisory')
      end

      format.json { render :show, status: :created, location: @advisory }
    end
  end

  # PATCH/PUT /advisories/1
  # PATCH/PUT /advisories/1.json
  def update
    @advisory.update(advisory_params) ||
      (render_unprocessable_entity(@advisory, :edit) && return)

    respond_to do |format|
      format.html do
        redirect_to [@server, @advisory],
                    notice: 'Advisory was successfully updated.'
      end

      format.json { render :show, status: :ok, location: @advisory }
    end
  end

  # DELETE /advisories/1
  # DELETE /advisories/1.json
  def destroy
    @advisory.destroy
    respond_to do |format|
      format.html do
        redirect_to server_advisories_url(@server),
                    notice: 'Advisory was successfully destroyed.'
      end

      format.json { head :no_content }
    end
  end

  # サーバの状態を送信する
  def send_server_status
    NoticeMailer.sendmail_confirm(@advisory.email, @advisory.server).deliver
    redirect_to server_advisory_url(@server, @advisory),
                notice: t('notice.sent')
  end

  # サーバの状態を全ての報告先にメイルする
  def send_server_status_to_advisories
    send_server_status_to_advisories_helper(@server) { |status| true }
    redirect_to server_advisories_url(@server), notice: t('notice.sent')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_advisory
    @advisory = @server.advisories.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the
  # white list through.
  def advisory_params
    params.require(:advisory).permit(:server_id, :email)
  end

  def load_advisory
    @server = Server.find(params[:server_id])
  end
end
