class ReInsController < ApplicationController
  before_action :set_re_in, only: [:show, :edit, :update, :destroy]

  # GET /re_ins
  def index
    @re_ins = ReIn.all
  end

  # GET /re_ins/1
  def show
  end

  # GET /re_ins/new
  def new
    @re_in = ReIn.new
  end

  # GET /re_ins/1/edit
  def edit
  end

  # POST /re_ins
  def create    
    puts '[rein create] start create ingredient'
    @ingredient = Ingredient.find_by_name(re_in_params[:ingredient_name])
    puts @ingredient
    if @ingredient
      puts 'found ingredient'
      puts @ingredient.name
    else
      puts 'creating ingredient'
      @ingredient = Ingredient.new({"name"=>re_in_params[:ingredient_name]})
      @ingredient.save
    end
    
    #@re_in = ReIn.new(re_in_params)
    @re_in = ReIn.new({"recipe_id"=>re_in_params[:recipe_id], "ingredient_id"=>@ingredient.id, "amount"=>re_in_params[:amount],
       "unit"=>re_in_params[:unit]})

    if @re_in.save
      respond_to do |format|
        format.js
      end      
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /re_ins/1
  def update
    if @re_in.update(re_in_params)
      redirect_to @re_in, notice: 'Re in was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /re_ins/1
  def destroy
    @re_in.destroy
    redirect_to re_ins_url, notice: 'Re in was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_re_in
      @re_in = ReIn.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def re_in_params
      params.require(:re_in).permit(:recipe_id, :ingredient_name, :ingredient_id, :amount, :unit)
    end
end
