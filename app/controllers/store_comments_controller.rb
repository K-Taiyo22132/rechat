class StoreCommentsController < ApplicationController
  before_action :set_store_comment, only: %i[ show edit update destroy ]

  # GET /store_comments or /store_comments.json
  def index
    @store_comments = StoreComment.all.order(created_at: :desc)
  end

  # GET /store_comments/1 or /store_comments/1.json
  def show
  end

  # GET /store_comments/new
  def new
    @store_comment = StoreComment.new
  end

  # GET /store_comments/1/edit
  def edit
  end

  # POST /store_comments or /store_comments.json
  def create
    @store_comment = StoreComment.new(store_comment_params)

    @store_comment.user_id = current_user.id

    if @store_comment.save
      redirect_to store_review_url(@store_comment.store_review_id), notice:"コメントを追加しました"
    else
      render :new
    end

    # respond_to do |format|
    #   if @store_comment.save
    #     format.html { redirect_to @store_comment, notice: "Store comment was successfully created." }
    #     format.json { render :show, status: :created, location: @store_comment }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @store_comment.errors, status: :unprocessable_entity }
    #   end
  
  end

  # PATCH/PUT /store_comments/1 or /store_comments/1.json
  def update
    respond_to do |format|
      if @store_comment.update(store_comment_params)
        format.html { redirect_to @store_comment, notice: "Store comment was successfully updated." }
        format.json { render :show, status: :ok, location: @store_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_comments/1 or /store_comments/1.json
  def destroy
    @store_comment.destroy

    respond_to do |format|
      format.html { redirect_to store_comments_path, status: :see_other, notice: "Store comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_comment
      @store_comment = StoreComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_comment_params
      params.require(:store_comment).permit(:comment, :store_review_id, :user_id)
    end
end
