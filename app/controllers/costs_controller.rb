class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]

  # GET /costs
  # GET /costs.json
  def index
    @costs = Cost.all
  end

  # GET /costs/1
  # GET /costs/1.json
  def show
  end

  # GET /costs/new
  def new
    @journal = Journal.find(params[:journal_id])
    @cost    = @journal.costs.new
    @costs   = @journal.costs
  end

  # GET /costs/1/edit
  def edit
    @journal = Journal.find(params[:journal_id])
    @costs   = @journal.costs
  end

  # POST /costs
  # POST /costs.json
  def create
    @journal = Journal.find(params[:journal_id])
    @cost    = @journal.costs.new(cost_params)

    respond_to do |format|
      if @cost.save
        format.html { redirect_to journal_path(@journal), notice: 'Cost was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cost }
      else
        format.html { render action: 'new' }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    @journal = Journal.find(params[:journal_id])

    respond_to do |format|
      if @cost.update(cost_params)
        format.html { redirect_to journal_path(@journal), notice: 'Cost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost.destroy
    respond_to do |format|
      format.html { redirect_to costs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_params
      params.require(:cost).permit(:count, :unit, :unit_price, :journal_id)
    end
end
