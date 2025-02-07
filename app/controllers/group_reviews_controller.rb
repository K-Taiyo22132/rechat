class GroupReviewsController < ApplicationController
  before_action :set_group_review, only: %i[ show edit update destroy ]

  # GET /group_reviews or /group_reviews.json
  def index
    
    
    @group_reviews = GroupReview.all
    # @group = GroupReview.find(Chat.find(params[:chat_id].group_id))

    #session["selected_group_id_#{current_user.id}"] = params[:group_id]
    
    @select_categories = SelectCategory.where(user_id: current_user.id)
    
      @goods_review = GoodsReview.where("group_id=?",session["selected_group_id_#{current_user.id}"]).order(created_at: :desc)
      @store_review = StoreReview.where("group_id=?",session["selected_group_id_#{current_user.id}"]).order(created_at: :desc)

      if params[:search].present? && params[:search][:keyword].present?
        @goods_review = GoodsReview.where("group_id=? and title like '%#{params[:search][:keyword]}%'", session["selected_group_id_#{current_user.id}"]).order(created_at: :desc)
        @store_review = StoreReview.where("group_id=? and title like '%#{params[:search][:keyword]}%'",session["selected_group_id_#{current_user.id}"]).order(created_at: :desc)
      
      else
        @goods_review = GoodsReview.where("group_id=?",session["selected_group_id_#{current_user.id}"]).order(created_at: :desc)
        @store_review = StoreReview.where("group_id=?",session["selected_group_id_#{current_user.id}"]).order(created_at: :desc)
      end
      if params[:selectedcategory].present? 
        @goods_review = @goods_review.where("category_id=?",params[:selectedcategory]).order(created_at: :desc)
        @store_review = @store_review.where("category_id=?",params[:selectedcategory]).order(created_at: :desc)
      end
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
    group = Group.find(session["selected_group_id_#{current_user.id}"])
    @store_review.category_id = group.category_id

    @store_review.user_id = current_user.id
    @store_review.group_id = session["selected_group_id_#{current_user.id}"]

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
