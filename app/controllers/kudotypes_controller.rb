class KudotypesController < ApplicationController
  before_action :set_kudotype, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :admin_only, :except => :index

  # GET /kudotypes
  # GET /kudotypes.json
  def index
    @kudotypes = Kudotype.all
  end

  # GET /kudotypes/1
  # GET /kudotypes/1.json
  def show
  end

  # GET /kudotypes/new
  def new
    @kudotype = Kudotype.new
  end

  # GET /kudotypes/1/edit
  def edit
  end

  # POST /kudotypes
  # POST /kudotypes.json
  def create
    @kudotype = Kudotype.new(kudotype_params)

    respond_to do |format|
      if @kudotype.save
        format.html { redirect_to @kudotype, notice: 'Kudotype was successfully created.' }
        format.json { render :show, status: :created, location: @kudotype }
      else
        format.html { render :new }
        format.json { render json: @kudotype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kudotypes/1
  # PATCH/PUT /kudotypes/1.json
  def update
    respond_to do |format|
      if @kudotype.update(kudotype_params)
        format.html { redirect_to @kudotype, notice: 'Kudotype was successfully updated.' }
        format.json { render :show, status: :ok, location: @kudotype }
      else
        format.html { render :edit }
        format.json { render json: @kudotype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kudotypes/1
  # DELETE /kudotypes/1.json
  def destroy
    @kudotype.destroy
    respond_to do |format|
      format.html { redirect_to kudotypes_url, notice: 'Kudotype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kudotype
      @kudotype = Kudotype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kudotype_params
      params.require(:kudotype).permit(:name)
    end
end
