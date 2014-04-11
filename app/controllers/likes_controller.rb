class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(hack_id: params[:hack_id])
    @hack = Hack.find(params[:hack_id])
    respond_to do |format|
      if @like.save
        format.json { render json: { :total_likes => @hack.likes.count }.to_json, status: :created}
        format.html { redirect_to root_path }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
        format.html { redirect_to @like.hack }
      end
    end
  end
  
  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    flash[:notice] = "Hack removed."
    redirect_to current_user
  end

  private 
    def like_params
      params.fetch(:like, {}).permit(:counter, hack_id: params[:like][:hack_id])
    end
end


