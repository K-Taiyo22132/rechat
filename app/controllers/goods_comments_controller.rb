class GoodsCommentsController < ApplicationController
  before_action :set_goods_comment, only: %i[ show edit update destroy ]

  # GET /goods_comments or /goods_comments.json
  def index
    @goods_comments = GoodsComment.all
  end

  # GET /goods_comments/1 or /goods_comments/1.json
  def show
  end

  # GET /goods_comments/new
  def new
    @goods_comment = GoodsComment.new
  end

  # GET /goods_comments/1/edit
  def edit
  end

  # POST /goods_comments or /goods_comments.json
  def create
    @goods_comment = GoodsComment.new(goods_comment_params)

    respond_to do |format|
      if @goods_comment.save
        format.html { redirect_to @goods_comment, notice: "Goods comment was successfully created." }
        format.json { render :show, status: :created, location: @goods_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goods_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods_comments/1 or /goods_comments/1.json
  def update
    respond_to do |format|
      if @goods_comment.update(goods_comment_params)
        format.html { redirect_to @goods_comment, notice: "Goods comment was successfully updated." }
        format.json { render :show, status: :ok, location: @goods_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goods_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_comments/1 or /goods_comments/1.json
  def destroy
    @goods_comment.destroy

    respond_to do |format|
      format.html { redirect_to goods_comments_path, status: :see_other, notice: "Goods comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goods_comment
      @goods_comment = GoodsComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goods_comment_params
      params.require(:goods_comment).permit(:comment, :goods_review_id, :user_id, :evaluation)
    end
end
