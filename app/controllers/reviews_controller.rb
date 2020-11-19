class ReviewsController < ApplicationController
  def new
    @toy = Toy.find(params[:toy_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @toy = Toy.find(params[:toy_id])
    @review.toy = @toy
    if @review.save
      redirect_to toy_path(@toy)
    else
      flash[:alert] = "Votre avis n'est pas enregistré."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :quality_rating, :security_rating, :fun_rating)
  end
end
