class RentsController < ApplicationController
  def index
    @rents = current_user.rents.all
  end

  def show
    @rent = Rent.find(params[:id])
    @toy = Toy.find(@rent.toy_id)
    @toy_user = User.find(@toy.user_id)
  end

  def new
    @rent = Rent.new
  end

  def create
    @toy = Toy.find(params[:toy_id])
    @price = params[:rent][:duration].to_i * @toy.unit_price
    @rent = Rent.create(duration: params[:rent][:duration], price: @price, status: "en cours", toy_id: params[:toy_id], user_id: current_user.id)
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
    redirect_to rents_path(@rent)
  end

  private

  def rent_params
    params.require(:rent).permit(:duration)
  end
end
