class SelectCategoriesController < ApplicationController
  before_action :set_select_category, only: %i[ show edit update destroy ]

  # GET /select_categories or /select_categories.json
  def index
    @select_categories = SelectCategory.all
  end

  # GET /select_categories/1 or /select_categories/1.json
  def show
  end

  # GET /select_categories/new
  def new
    @select_category = SelectCategory.new
    #保存済のデータを取得する
    @select_categories = SelectCategory.where(user_id: current_user.id)
  end

  # GET /select_categories/1/edit
  def edit
  end

  # POST /select_categories or /select_categories.json
  def create
    
    begin
      ActiveRecord::Base.transaction do
        #保存されているデータをいったん削除する。
        @select_categories = SelectCategory.where(user_id: current_user.id)
        @select_categories.each do |select_category|
          select_category.destroy!
        end

        #配列形式で取得したデータを保存する
        if params[:select_category].present?
         select_category_params[:category_id].each do|category|
            @select_category = SelectCategory.new(user_id: current_user.id,category_id: category)
            @select_category.save!
          end
        end
      end
      
      #正常終了の時
      redirect_to groups_path,notice:"Select category was successfully created."

      #異常終了の時
      rescue => e
        @select_category = SelectCategory.new
        @select_categories = SelectCategory.where(user_id: current_user.id)
        render :new
    end
  end
    

  

  # PATCH/PUT /select_categories/1 or /select_categories/1.json
  def update
    respond_to do |format|
      if @select_category.update(select_category_params)
        format.html { redirect_to @select_category, notice: "Select category was successfully updated." }
        format.json { render :show, status: :ok, location: @select_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @select_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /select_categories/1 or /select_categories/1.json
  def destroy
    @select_category.destroy

    respond_to do |format|
      format.html { redirect_to select_categories_path, status: :see_other, notice: "Select category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def send_image
  #   select_category = Select_Category.find(params[:id])
  #   send_data(select_category.select_category_image,disposition: :inline)
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_select_category
      @select_category = SelectCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def select_category_params
      params.require(:select_category).permit(category_id: [])
    end
end
