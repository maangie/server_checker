class AdvisoriesController < ApplicationController
  before_filter :load_advisory
  before_action :set_advisory, only: [:show, :edit, :update, :destroy]

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
    @advisory = @server.advisory.build
  end

  # GET /advisories/1/edit
  def edit
  end

  # POST /advisories
  # POST /advisories.json
  def create
    @advisory = @server.advisories.build(advisory_params)

    respond_to do |format|
      if @advisory.save
        format.html do
          redirect_to [@server, @advisory],
                      notice: 'Advisory was successfully created.' 
        end

        format.json { render :show, status: :created, location: @advisory }
      else
        format.html { render :new }

        format.json do
          render json: @advisory.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /advisories/1
  # PATCH/PUT /advisories/1.json
  def update
    respond_to do |format|
      if @advisory.update(advisory_params)
        format.html do
          redirect_to [@server, @advisory],
                      notice: 'Advisory was successfully updated.'
        end
        
        format.json { render :show, status: :ok, location: @advisory }
      else
        format.html { render :edit }

        format.json do
          render json: @advisory.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /advisories/1
  # DELETE /advisories/1.json
  def destroy
    @advisory.destroy
    respond_to do |format|
      format.html do
        redirect_to advisories_url,
                    notice: 'Advisory was successfully destroyed.'
      end

      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_advisory
    @advisory = @server.advisory.find(params[:id])
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
