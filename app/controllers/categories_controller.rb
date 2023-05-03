class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  def index
    @room = Room.find(params[:room_id])
    @categories = @room.categories.includes(:room)
    @category = Category.new
  end
  def create
    # binding.pry
    @room = Room.find(params[:room_id])
    @category = @room.categories.new(category_params)

    if @category.save
      redirect_to room_categories_path(@room.id)
    else
      render :new
    end
  end

  def edit
  end

    def update
      if @category.update(category_params)
        redirect_to room_categories_path(@room.id)
      else
        render :edit
      end
    end
  
    def destroy
      @category.destroy
      redirect_to room_categories_path(@room.id)
    end


  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @room = Room.find(params[:room_id])
    @category = @room.categories.find(params[:id])
  end
  
end
