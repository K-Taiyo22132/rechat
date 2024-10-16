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
    @store_review = StoreReview.new(store_review_params)

    respond_to do |format|
      if @store_review.save
        format.html { redirect_to @store_review, notice: "Store review was successfully created." }
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
      if @store_review.update(store_review_params)
        format.html { redirect_to @store_review, notice: "Store review was successfully updated." }
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
      format.html { redirect_to store_reviews_path, status: :see_other, notice: "Store review was successfully destroyed." }
      format.json { head :no_content }
    end
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
end
