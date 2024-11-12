class StoreReviewsController < ApplicationController
  before_action :set_store_review, only: %i[ show edit update destroy ]

  # GET /store_reviews or /store_reviews.json
  def index
    session["selected_group_id_#{current_user.id}"] = params[:group_id]
    
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
    
    image_path = Rails.root.join("public/images/","railskame.jpg")
    group = Group.find(session["selected_group_id_#{current_user.id}"])
    @store_review.category_id = group.category_id

    @store_review.user_id = current_user.id
    @store_review.group_id = session["selected_group_id_#{current_user.id}"]

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
      params.require(:store_review).permit(:title, :review_image, :review, :spot, :tell, :evaluation)
    end

    def store_review_attributes
      {
        title: store_review_params[:title], review_image: store_review_params[:review_image].read, review: store_review_params[:review], spot: store_review_params[:spot], tell: store_review_params[:tell], evaluation:store_review_params[:evaluation] 
      }
    end

    # def search
    #   if params[:search].present? && params[:search][:group].present?
    #     session[:search_group] = params[:search][:group]
    #   else
    #     session[:search_group] = nil
    #   end
      
    #   redirect_to store_review_path
    # end
end
