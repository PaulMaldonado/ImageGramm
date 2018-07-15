class PicsController < ApplicationController

  def index
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)

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
  end

  def destroy
  end

  private

  def find_pics
  end

  def pic_params
  end
end
