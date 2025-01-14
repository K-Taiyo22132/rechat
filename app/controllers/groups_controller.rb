class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    if params[:search].present? && params[:search][:keyword].present?
      @groups = Group.where("name like '%#{params[:search][:keyword]}%'").order(created_at: :desc)
    else
      @groups = Group.all.order(created_at: :desc)
    end
    if params[:selectedcategory].present? 
      @groups = @groups.where("category_id=?",params[:selectedcategory]).order(created_at: :desc)
    end

    @select_categories = SelectCategory.where(user_id: current_user.id)
    session["selected_group_id_#{current_user.id}"] = params[:group_id]
    
  end

  # def search
  #   @groups = Group.all
  # end

  # GET /groups/1 or /groups/1.json
  # def show
  # end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_attributes)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_attributes)
        format.html { redirect_to @group, notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_path, status: :see_other, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def show
    @group = Group.find(params[:id])
    @chat = Chat.find_by(group_id:params[:id])
    if @chat.nil?
      @chat = Chat.new
    end
    session["selected_group_id_#{current_user.id}"] = params[:id]
  end

  def send_image
    group = Group.find(params[:id])
    send_data(group.group_image,disposition: :inline)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :group_image, :introduction, :category_id)
    end
    def group_attributes
      {
        name: group_params[:name],group_image: group_params[:group_image].read,introduction:group_params[:introduction],category_id:group_params[:category_id]
      }
    end

end


