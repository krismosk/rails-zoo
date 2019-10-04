class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end
  
  def show 
    @animal = Animal.find_by(id: params[:id])
    if @animal.nil?
      flash[:error] = "Could not find animal with this id"
      redirect_to animals_path
      return
    end
  end
  
  def new
    @animal = Animal.new
  end
  
  def create
    @animal = Animal.new(create_animal_params)
    
    if @animal.save
      redirect_to @animal
      return
    else
      render :new
      return
    end
  end
  
  private
  
  def create_animal_params
    params.require(:animal).permit(:name, :species, :age)
  end
  
  
  
  
end
