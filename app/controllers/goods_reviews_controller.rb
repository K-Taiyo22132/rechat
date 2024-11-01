class GoodsReviewsController < ApplicationController
  before_action :set_goods_review, only: %i[ show edit update destroy ]

  # GET /goods_reviews or /goods_reviews.json
  def index
    @goods_reviews = GoodsReview.all
  end

  # GET /goods_reviews/1 or /goods_reviews/1.json
  def show
  end

  # GET /goods_reviews/new
  def new
    @goods_review = GoodsReview.new
  end

  # GET /goods_reviews/1/edit
  def edit
  end

  # POST /goods_reviews or /goods_reviews.json
  def create
    @goods_review = GoodsReview.new(goods_review_params)

    respond_to do |format|
      if @goods_review.save
        format.html { redirect_to @goods_review, notice: "Goods review was successfully created." }
        format.json { render :show, status: :created, location: @goods_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goods_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods_reviews/1 or /goods_reviews/1.json
  def update
    respond_to do |format|
      if @goods_review.update(goods_review_params)
        format.html { redirect_to @goods_review, notice: "Goods review was successfully updated." }
        format.json { render :show, status: :ok, location: @goods_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goods_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_reviews/1 or /goods_reviews/1.json
  def destroy
    @goods_review.destroy

    respond_to do |format|
      format.html { redirect_to goods_reviews_path, status: :see_other, notice: "Goods review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goods_review
      @goods_review = GoodsReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goods_review_params
      params.require(:goods_review).permit(:title, :review_image, :review, :evaluation, :price, :category_id, :user_id, :group_id)
    end
end
