class GroupReviewsController < ApplicationController
  before_action :set_group_review, only: %i[ show edit update destroy ]

  # GET /group_reviews or /group_reviews.json
  def index
    @group_reviews = GroupReview.all
    @select_categories = SelectCategory.where(user_id: current_user.id)
  end

  # GET /group_reviews/1 or /group_reviews/1.json
  def show
  end

  # GET /group_reviews/new
  def new
    @group_review = GroupReview.new
  end

  # GET /group_reviews/1/edit
  def edit
  end

  # POST /group_reviews or /group_reviews.json
  def create
    @group_review = GroupReview.new(group_review_params)

    respond_to do |format|
      if @group_review.save
        format.html { redirect_to @group_review, notice: "Group review was successfully created." }
        format.json { render :show, status: :created, location: @group_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_reviews/1 or /group_reviews/1.json
  def update
    respond_to do |format|
      if @group_review.update(group_review_params)
        format.html { redirect_to @group_review, notice: "Group review was successfully updated." }
        format.json { render :show, status: :ok, location: @group_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_reviews/1 or /group_reviews/1.json
  def destroy
    @group_review.destroy

    respond_to do |format|
      format.html { redirect_to group_reviews_path, status: :see_other, notice: "Group review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_review
      @group_review = GroupReview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_review_params
      params.require(:group_review).permit(:category_id, :group_id, :store_review_id, :goods_review, :user_id)
    end
end
