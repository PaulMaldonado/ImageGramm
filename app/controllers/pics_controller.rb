class PicsController < ApplicationController
  before_action :find_pics, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pics = Pic.where(user_id: current_user)
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
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic
    else
      render :edit
    end
  end

  def destroy
    @pic.destroy

    redirect_to pic_path
  end

  private

  def find_pics
    @pic = Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end
end
