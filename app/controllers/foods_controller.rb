class FoodsController < ApplicationController
  def index
    @foods = Food.where(user: current_user) || []
  end

  def new
    @food = Food.new
    render 'new'
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end