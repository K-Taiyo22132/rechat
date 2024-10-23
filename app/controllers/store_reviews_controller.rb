class StoreReviewsController < ApplicationController
  before_action :set_store_review, only: %i[ show edit update destroy ]

  # GET /store_reviews or /store_reviews.json
  def index
    @store_reviews = StoreReview.all
  end

  # GET /store_reviews/1 or /store_reviews/1.json
  def show
  end

  # GET /store_reviews/new
  def new
    @store_review = StoreReview.new
  end

  # GET /store_reviews/1/edit
  def edit
  end

  # POST /store_reviews or /store_reviews.json
  def create
    @store_review = StoreReview.new(store_review_attributes)

    respond_to do |format|
      if @store_review.save
        format.html { redirect_to store_review_url(@store_review), notice: "Store review was successfully created." }
        format.json { render :show, status: :created, location: @store_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_reviews/1 or /store_reviews/1.json
  def update
    respond_to do |format|
      if @store_review.update(store_review_attributes)
        format.html { redirect_to store_review_url(@store_review), notice: "Store review was successfully updated." }
        format.json { render :show, status: :ok, location: @store_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_reviews/1 or /store_reviews/1.json
  def destroy
    @store_review.destroy

    respond_to do |format|
      format.html { redirect_to store_reviews_url, status: :see_other, notice: "Store review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def send_image
    store_review = StoreReview.find(params[:id])
    send_data(store_review.review_image, disposition: :inline)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_review
      @store_review = StoreReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_review_params
      params.require(:store_review).permit(:title, :review_image, :review, :evaluation, :spot, :tell, :category_id, :user_id, :group_id)
    end

    def store_review_attributes
      {
        title: store_review_params[:title], review_image: store_review_params[:review_image].read, review: store_review_params[:review], evaluation: store_review_params[:evaluation], spot: store_review_params[:spot], tell: store_review_params[:tell], category_id: store_review_params[:category_id], user_id: store_review_params[:user_id], group_id: store_review_params[:group_id]
      }
    end
end
