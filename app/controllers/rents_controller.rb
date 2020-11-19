class RentsController < ApplicationController
  def index
    rents = current_user.rents.all
    @new_rents = rents.where(status: "en attente de confirmation").order(id: :desc)
    @refused_rents = rents.where(status: "refusée").order(id: :desc)
    @validated_rents = rents.where(status: "validée").order(id: :desc)
  end

  def show
    @rent = Rent.find(params[:id])
    @toy = Toy.find(@rent.toy_id)
    @toy_user = User.find(@toy.user_id)
  end

  def show_user_rent_demands
    @new_rents = Rent.select('rents.*').joins(:toy).group('rents.id')
                     .where(toys: { user_id: current_user.id })
                     .where(rents: { status: "en attente de confirmation" })
    @refused_rents = Rent.select('rents.*').joins(:toy).group('rents.id')
                         .where(toys: { user_id: current_user.id })
                         .where(rents: { status: "refusée" })
    @validated_rents = Rent.select('rents.*').joins(:toy).group('rents.id')
                           .where(toys: { user_id: current_user.id })
                           .where(rents: { status: "validée" })
  end

  def new
    @rent = Rent.new
    @toy = Toy.find(params[:toy_id])
  end

  def create
    @toy = Toy.find(params[:toy_id])
    @price = params[:rent][:duration].to_i * @toy.unit_price
    @rent = Rent.create(duration: params[:rent][:duration], price: @price, status: "en attente de confirmation", toy_id: params[:toy_id], user_id: current_user.id)
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

  def validate_rent
    @rent = Rent.find(params[:id])
    @rent.update(status: "validée")
    redirect_to user_rent_demands_path
  end

  def refuse_rent
    @rent = Rent.find(params[:id])
    @rent.update(status: "refusée")
    redirect_to user_rent_demands_path
  end

  private

  def rent_params
    params.require(:rent).permit(:duration)
  end
end
