class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /categories/new
  def new
    @account = current_account
    @category = @account.categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @account = current_account
    @category = @account.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to settings_path, notice: I18n.t('activerecord.messages.category_created') }
        format.json { render settings_path, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to settings_path, notice: I18n.t('activerecord.messages.category_updated') }
        format.json { render settings_path, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to settings_path, notice: I18n.t('activerecord.messages.category_destroyed') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit( :name, :color )
  end
end
