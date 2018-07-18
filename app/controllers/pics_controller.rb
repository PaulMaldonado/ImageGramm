class PicsController < ApplicationController
  before_action :find_pics, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    @pic = Pic.update(pic_params)

    if @pic.save
      redirect_to @pic
    else
      render :edit
    end
  end

  def destroy
    @pic.destroy

    redirect_to root_path
  end

  private

  def find_pics
    @pic = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :description)
  end
end
