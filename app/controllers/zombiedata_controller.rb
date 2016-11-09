class ZombiedataController < ApplicationController
  include ApiCommunication
  protect_from_forgery with: :null_session
  before_action :set_zombiedatum, only: [:show, :edit, :update, :destroy]

  # GET /zombiedata
  # GET /zombiedata.json
  def index
    @zombiedata = Zombiedatum.all
  end

  # GET /zombiedata/1
  # GET /zombiedata/1.json
  def show
  end

  # GET /zombiedata/new
  def new
    @zombiedatum = Zombiedatum.new
  end

  # GET /zombiedata/1/edit
  def edit
  end

  # POST /zombiedata
  # POST /zombiedata.json
  def create
    @zombiedatum = Zombiedatum.new(zombiedatum_params)
    respond_to do |format|
      if @zombiedatum.save
        api_record_create @zombiedatum
        format.html { redirect_to @zombiedatum, notice: 'Zombiedatum was successfully created.' }
        format.json { render :show, status: :created, location: @zombiedatum }
      else
        format.html { render :new }
        format.json { render json: @zombiedatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zombiedata/1
  # PATCH/PUT /zombiedata/1.json
  def update
    if params[:zombiedatum][:status] == "Cured"
      @zombiedatum.destroy
      api_record_delete @zombiedatum
      redirect_to action: "index"
    else
      respond_to do |format|
        if @zombiedatum.update(zombiedatum_params)
          api_record_update @zombiedatum
          format.html { redirect_to @zombiedatum, notice: 'Zombiedatum was successfully updated.' }
          format.json { render :show, status: :ok, location: @zombiedatum }
        else
          format.html { render :edit }
          format.json { render json: @zombiedatum.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /zombiedata/1
  # DELETE /zombiedata/1.json
  def destroy
    @zombiedatum.destroy
    respond_to do |format|
      format.html { redirect_to zombiedata_url, notice: 'Zombiedatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    #@search_result = Zombiedatum.where(['name LIKE ?',"%#{params[:q]}%"]) if !params[:q].blank?
    if params[:q].present?
      @search_result = Zombiedatum.find(params[:q]) if Zombiedatum.exists?(id:params[:q])
      @search_result = api_record_find params if @search_result.blank?
    else
      flash[:notice] = 'Record not found.' if @search_result.nil?
      redirect_to action: "index"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombiedatum
      @zombiedatum = Zombiedatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zombiedatum_params
      params.require(:zombiedatum).permit(:name, :age, :weight, :status)
    end

end
