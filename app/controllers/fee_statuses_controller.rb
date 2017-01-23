class FeeStatusesController < ApplicationController
  before_action :set_fee_status, only: [:show, :edit, :update, :destroy]

  # GET /fee_statuses
  # GET /fee_statuses.json
  def index
    @fee_status = FeeStatus.new
    @fee_statuses=get_collections_of_fee_status
  end

  # GET /fee_statuses/1
  # GET /fee_statuses/1.json
  def show
  end

  # GET /fee_statuses/new
  def new
    @fee_status = FeeStatus.new
  end

  # GET /fee_statuses/1/edit
  def edit
  end

  # POST /fee_statuses
  # POST /fee_statuses.json
  def create
    @fee_status = FeeStatus.new(fee_status_params)

    respond_to do |format|
      if @fee_status.save
        format.html { redirect_to @fee_status, notice: 'Fee status was successfully created.' }
        format.json { render :show, status: :created, location: @fee_status }
      else
        format.html { render :new }
        format.json { render json: @fee_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_statuses/1
  # PATCH/PUT /fee_statuses/1.json
  def update
    respond_to do |format|
      if @fee_status.update(fee_status_params)
        format.html { redirect_to @fee_status, notice: 'Fee status was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee_status }
      else
        format.html { render :edit }
        format.json { render json: @fee_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_collections_of_fee_status
   fee_statuses = FeeStatus.where("")
   fee_statuses = fee_statuses.where("student_id = ?",params[:student_id])
   fee_statuses
  end

  # DELETE /fee_statuses/1
  # DELETE /fee_statuses/1.json
  def destroy
    @fee_status.destroy
    respond_to do |format|
      format.html { redirect_to fee_statuses_url, notice: 'Fee status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_status
      @fee_status = FeeStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_status_params
      params.require(:fee_status).permit(:amount_paid, :paid_date,:student_id)
    end
end
