class SelectReviewsController < ApplicationController
  before_action :set_select_review, only: %i[ show edit update destroy ]

  # GET /select_reviews or /select_reviews.json
  def index
    @select_reviews = SelectReview.all
  end

  # GET /select_reviews/1 or /select_reviews/1.json
  def show
  end

  # GET /select_reviews/new
  def new
    @select_review = SelectReview.new
  end

  # GET /select_reviews/1/edit
  def edit
  end

  # POST /select_reviews or /select_reviews.json
  def create
    @select_review = SelectReview.new(select_review_params)

    respond_to do |format|
      if @select_review.save
        format.html { redirect_to @select_review, notice: "Select review was successfully created." }
        format.json { render :show, status: :created, location: @select_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @select_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /select_reviews/1 or /select_reviews/1.json
  def update
    respond_to do |format|
      if @select_review.update(select_review_params)
        format.html { redirect_to @select_review, notice: "Select review was successfully updated." }
        format.json { render :show, status: :ok, location: @select_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @select_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_reviews/1 or /select_reviews/1.json
  def destroy
    @select_review.destroy

    respond_to do |format|
      format.html { redirect_to select_reviews_path, status: :see_other, notice: "Select review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_select_review
      @select_review = SelectReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def select_review_params
      params.require(:select_review).permit(:goods_review_id, :store_review_id)
    end
end
