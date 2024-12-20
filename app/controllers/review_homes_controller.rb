class ReviewHomesController < ApplicationController
  before_action :set_review_home, only: %i[ show edit update destroy ]

  # GET /review_homes or /review_homes.json
  def index
    if params[:search].present? && params[:search][:keyword].present?
      @goods_review = GoodsReview.where("title like '%#{params[:search][:keyword]}%'").order(created_at: :desc)
      @store_review = StoreReview.where("title like '%#{params[:search][:keyword]}%'").order(created_at: :desc)
    else
      @goods_review = GoodsReview.all.order(created_at: :desc)
      @store_review = StoreReview.all.order(created_at: :desc)
    end
    
    @select_categories = SelectCategory.where(user_id: current_user.id)
    session["selected_group_id_#{current_user.id}"] = params[:group_id]
  end

  # GET /review_homes/1 or /review_homes/1.json
  def show
  end

  # GET /review_homes/new
  def new
    @review_home = ReviewHome.new
  end

  # GET /review_homes/1/edit
  def edit
  end

  # POST /review_homes or /review_homes.json
  def create
    @review_home = ReviewHome.new(review_home_params)

    respond_to do |format|
      if @review_home.save
        format.html { redirect_to @review_home, notice: "Review home was successfully created." }
        format.json { render :show, status: :created, location: @review_home }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /review_homes/1 or /review_homes/1.json
  def update
    respond_to do |format|
      if @review_home.update(review_home_params)
        format.html { redirect_to @review_home, notice: "Review home was successfully updated." }
        format.json { render :show, status: :ok, location: @review_home }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_homes/1 or /review_homes/1.json
  def destroy
    @review_home.destroy

    respond_to do |format|
      format.html { redirect_to review_homes_path, status: :see_other, notice: "Review home was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def send_image
    category = Category.find(params[:id])
    send_data(category.category_image, disposition: :inline)
    goods_review = GoodsReview.find(params[:id])
    send_data(goods_review.review_image, disposition: :inline)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_home
      @review_home = ReviewHome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_home_params
      params.require(:review_home).permit(:category_id, :goods_review_id, :store_review_id, :group_id)
    end
    
end
