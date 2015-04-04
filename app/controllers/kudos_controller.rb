class KudosController < ApplicationController
  before_action :set_kudo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /kudos
  # GET /kudos.json
  def index

    if current_user.admin?
      @kudos = Kudo.all
    else
      @kudos = Kudo.where("receiver_id = ?", current_user[:id])
    end
  end

  # GET /kudos/1
  # GET /kudos/1.json
  def show
  end

  # GET /kudos/new
  def new
    @kudo = Kudo.new
  end

  # GET /kudos/1/edit
  def edit
  end

  # POST /kudos
  # POST /kudos.json
  def create
   @kudo = Kudo.new(kudo_params)
   @kudo.giver = current_user

    respond_to do |format|
      if @kudo.save
        UserNotifier.send_notification_email(current_user).deliver
        format.html { redirect_to @kudo, notice: 'Kudo was successfully created.' }
        format.json { render :show, status: :created, location: @kudo }
      else
        format.html { render :new }
        format.json { render json: @kudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kudos/1
  # PATCH/PUT /kudos/1.json
  def update
    respond_to do |format|
      if @kudo.update(kudo_params)
        format.html { redirect_to @kudo, notice: 'Kudo was successfully updated.' }
        format.json { render :show, status: :ok, location: @kudo }
      else
        format.html { render :edit }
        format.json { render json: @kudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kudos/1
  # DELETE /kudos/1.json
  def destroy
    @kudo.destroy
    respond_to do |format|
      format.html { redirect_to kudos_url, notice: 'Kudo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kudo
      @kudo = Kudo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kudo_params
      params.require(:kudo).permit(:giver_id, :receiver_id, :comments, :kudotype_ids => [])
    end
end
