class ReviewsController < ApplicationController

 def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user

    # Another option, but results in `no such method whales for nil:NilClass` if the alien doesn't exist
    # @alien = Alien.find(params[:alien_id])
    # @whale = @alien.whales.new(whale_params)

    if @review.save
      redirect_to @review.product, notice: 'Whale was successfully created.'
    else
      redirect_to @review.product, notice: 'Failed to create the whale'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :description)
    end

end


