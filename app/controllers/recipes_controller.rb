class RecipesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :edit, :update]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    type = params[:type]
    category = params[:category]
    commodity = params[:commodity]
    search = params[:q]
    
    if type
      @recipes = Recipe.where(type_id: type)
    elsif category
      @recipes = Recipe.where(category_id: category)
    elsif commodity
      @recipes = Recipe.where(commodity_id: commodity)
    elsif search
      @recipes = Recipe.joins('inner Join re_ins on recipes.id = re_ins.recipe_id
        join ingredients on re_ins.ingredient_id = ingredients.id').where('ingredients.name LIKE :ingredient_name', :ingredient_name => '%' + search + '%'
      )
    else
      @recipes = Recipe.all.order('title ASC')
    end  
        
  end
  
  

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    @re_in = ReIn.new
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        @me_re = MeRe.new({"recipe_id"=>@recipe.id, "meal_id"=>@recipe.meal_id, "recipe_sort_order" => @recipe.sort_order})
        @me_re.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:meal_id, :category_id, :type_id, :commodity_id, :title, :ingress, :body, :prepare_hours, :prepare_minutes, :cooking_hours, :cooking_minutes, :servings, :sort_order, :img_1)
    end

    # Before filters
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Logg inn."
      end
    end
    
end
