class MeResController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :edit, :update]
  before_action :set_me_re, only: [:show, :edit, :update, :destroy]

  # GET /me_res
  # GET /me_res.json
  def index
    @me_res = MeRe.all
  end

  # GET /me_res/1
  # GET /me_res/1.json
  def show
  end

  # GET /me_res/new
  def new
    @me_re = MeRe.new
    @me_re.recipe_id = params[:recipe_id]
    @recipe_name = params[:recipe_name]
  end

  # GET /me_res/1/edit
  def edit
  end

  # POST /me_res
  # POST /me_res.json
  def create
    @me_re = MeRe.new(me_re_params)

    respond_to do |format|
      if @me_re.save
        format.html { redirect_to @me_re, notice: 'Me re was successfully created.' }
        format.json { render action: 'show', status: :created, location: @me_re }
      else
        format.html { render action: 'new' }
        format.json { render json: @me_re.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /me_res/1
  # PATCH/PUT /me_res/1.json
  def update
    respond_to do |format|
      if @me_re.update(me_re_params)
        format.html { redirect_to @me_re, notice: 'Me re was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @me_re.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /me_res/1
  # DELETE /me_res/1.json
  def destroy
    @me_re.destroy
    respond_to do |format|
      format.html { redirect_to me_res_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_me_re
      @me_re = MeRe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def me_re_params
      params.require(:me_re).permit(:recipe_id, :meal_id, :recipe_sort_order)
    end
    
    # Before filters
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Logg inn."
      end
    end
    
end
