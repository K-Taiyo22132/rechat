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
  end

  # GET /select_categories/1/edit
  def edit
  end

  # POST /select_categories or /select_categories.json
  def create
    @select_category = SelectCategory.new(select_category_params)

    respond_to do |format|
      if @select_category.save
        format.html { redirect_to @select_category, notice: "Select category was successfully created." }
        format.json { render :show, status: :created, location: @select_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @select_category.errors, status: :unprocessable_entity }
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_select_category
      @select_category = SelectCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def select_category_params
      params.require(:select_category).permit(:user_id, :category_id)
    end
end
