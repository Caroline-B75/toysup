class RentsController < ApplicationController
  def index
    @toy = Toy.find(params[:id])
    @user = current_user
    @rents = current_user.rents.all
  end

  def show
    @rent = Rent.find(params[:id])
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      redirect_to rent_path(@rent)
    else
      render :new
    end
  end

  def edit
    @rent = Rent.find(params[:id])
  end

  def update
    @rent = Rent.find(params[:id])
    if @rent.update(rent_params)
      redirect_to rent_path(@rent)
    else
      render :new
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    @rent.delete
    redirect_to profile_path(@rent)
  end

  private

  def rent_params
    params.require(:rent).permit(:duration, :price)
  end
end
