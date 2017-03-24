class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  # GET /animals
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  def show
    @image = Apis::Pixabay.get_image @animal.name
  end

  # GET /animals/new
  def new
    @animal = Animal.new
    @zoos = Zoo.all
  end

  # GET /animals/1/edit
  def edit
    @zoos = Zoo.all
  end

  # POST /animals
  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /animals/1
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully destroyed.' }
    end
  end

  private
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def animal_params
      params.require(:animal).permit(:name, :zoo_id)
    end
end
