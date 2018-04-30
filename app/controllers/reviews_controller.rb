class ReviewsController < ApplicationController

def create
  @user = User.find(params[:id])
  @review = Review.new(review_params)
  @review.customer_id = current_user.id 
  @review.chef_id = params[:id]
  # I am not sure why this if statement isn't working and instead I am getting the active record error?
  if @review.save
    redirect_to "/users/#{params[:id].to_i}"
  else
    @message = "Please fill in all the fields"
    render 'users/show'
  end
end

private
  
  def review_params
    params.require(:review).permit(:rating, :review)
  end

end
