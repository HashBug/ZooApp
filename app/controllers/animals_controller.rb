class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy]

  # GET /animals
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  def show
      uri = URI('https://pixabay.com/api/')
      params = { :key => '4910604-0fbd8071304388b7c0776f797',:q => @animal.name }
      uri.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(uri)
      result = JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
      @image = result['hits'][0]['previewURL']
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
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
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
