class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(hack_id: params[:hack_id])
    if @like.save
      # @like.counter += 1
      flash[:notice] = "Your awesome hack was saved!"
      redirect_to root_path
    else
      flash[:error] = "Sorry we aren't able to save the awesome hack right now."
      redirect_to @like.hack
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


