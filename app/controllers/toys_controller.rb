class ToysController < ApplicationController

  def index
    if params[:search].present?
      @toys = Toy.search_by_name_and_description_and_category(params[:search][:query])
    elsif params[:category]
      @toys = Toy.where(category: params[:category])
    else
      @toys = Toy.all
    end
  end

  def show
    @toy = Toy.find(params[:id])
    @reviews = @toy.reviews
    (@average_quality_rating = @reviews.average(:quality_rating)
    @average_security_rating = @reviews.average(:security_rating)
    @average_fun_rating = @reviews.average(:fun_rating)
    @sum = (@average_quality_rating + @average_quality_rating + @average_fun_rating)
    @average_rating = @sum / 3) unless @reviews.average(:quality_rating).nil?
  end

  def show_user_toy
    user_id = current_user.id
    @toys = Toy.where(user_id: user_id)
  end

  def new
    @toy = Toy.new
    @reviews = @toy.reviews
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.user = current_user
    @toy.save
    if @toy.save
      redirect_to user_toys_path
    else
      render :new
    end
  end

  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy
    redirect_to toys_path
  end

  def edit
    @toy = Toy.find(params[:id])
  end

  def update
    @toy = Toy.find(params[:id])
    @toy.update(toy_params)

    redirect_to user_toys_path
  end

  private

  def toy_params
    params.require(:toy).permit(:name, :description, :category, :photo, :unit_price)
  end

end
