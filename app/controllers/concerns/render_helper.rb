module RenderHelper
  # create, patch, put が失敗した時の render
  def render_unprocessable_entity(object, action)
    respond_to do |format|
      format.html { render action }
      format.json { render json: object.errors, status: :unprocessable_entity }
    end
  end
end
