class ZoosController < ApplicationController
  before_action :set_zoo, only: [:show, :edit, :update, :destroy]

  def index
    @zoos = Zoo.all
  end

  def show
  end


  def new
    @zoo = Zoo.new
  end

  def edit
  end


  def create
    @zoo = Zoo.new(zoo_params)

    respond_to do |format|
      if @zoo.save
        format.html { redirect_to @zoo, notice: 'Zoo was successfully created.' }
        # format.json { render :show, status: :created, location: @zoo }
      else
        format.html { render :new }
      end
    end
  end

  #/PUT /zoos/1
  def update
    respond_to do |format|
      if @zoo.update(zoo_params)
        format.html { redirect_to @zoo, notice: 'Zoo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /zoos/:id
  def destroy
    @zoo.destroy
    respond_to do |format|
      format.html { redirect_to zoos_url, notice: 'Zoo was successfully destroyed.' }
    end
  end

  private
    def set_zoo
      @zoo = Zoo.find(params[:id])
    end

    def zoo_params
      params.require(:zoo).permit(:name, :city, :zipcode, :publish)
    end
end
