class HacksController < ApplicationController
  before_action :set_hack, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @hacks = Hack.all.order("created_at DESC")
  end

  def show
    # @hack = Hack.find(params[:id])
  end

  def new
    @hack = current_user.hacks.build
  end

  def edit
    @hack = Hack.find(params[:id])
  end

  def create
    @hack = current_user.hacks.build(hack_params)
    if @hack.save
      redirect_to @hack, notice: 'Hack was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @hack = Hack.find(params[:id])
    if @hack.update(hack_params)
      redirect_to @hack, notice: 'Hack was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    Hack.find(params[:id]).destroy
    redirect_to hacks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hack
      @hack = Hack.find(params[:id])
    end

    def correct_user
      @hack = current_user.hacks.find_by(id: params[:id])
      redirect_to hacks_path, notice: "Not authorized to edit this hack" if @hack.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hack_params
      params.require(:hack).permit(:description, :image)
    end
end