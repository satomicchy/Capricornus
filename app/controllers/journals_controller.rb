class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  def calendar

  end

  # GET /journals
  # GET /journals.json
  def index
    date = params[:month] ? Date.new(params[:year].to_i, params[:month].to_i, 1) : Date.today
    @journals = Journal.current_month(date).order("start_at")

    respond_to do |format|
      format.html
      format.json { render json: @journals }
    end
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    @costs = @journal.costs
  end

  # GET /journals/new
  def new
    if params[:date]
      (year, month, day) = params[:date].split('-')
      base_start_time  = Time.new(year.to_i, month.to_i, day.to_i, 8, 0)
      base_finish_time = Time.new(year.to_i, month.to_i, day.to_i, 17, 0)
    end

    @journal = Journal.new(start_at: base_start_time, finish_at: base_finish_time)
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    if params[:journal][:base_id].present?
      base_journal = Journal.find(params[:journal][:base_id])
      journal      = base_journal.attributes.reject{|k, v| k == "id" || k == "created_at" || k == "updated_at"}
      @journal           = Journal.new(journal)
      @journal.start_at  = @journal.start_at + params[:journal][:day_delta].to_i.days
      @journal.finish_at = @journal.finish_at + params[:journal][:day_delta].to_i.days
      @journal.save

      base_costs = base_journal.costs
      if base_costs.present?
        base_costs.each do |base_cost|
          cost     = base_cost.attributes.reject{|k, v| k == "id" || k == "created_at" || k == "updated_at"}
          new_cost            = Cost.new(cost)
          new_cost.journal_id = @journal.id
          new_cost.save
        end
      end

      respond_to do |format|
        format.json { render action: 'show'}
      end
      return
    else
      @journal = Journal.new(journal_params)

      respond_to do |format|
        if @journal.save
          format.html { redirect_to @journal, notice: '日誌が登録されました。' }
        else
          format.html { render action: 'new' }
        end
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: '日誌が更新されました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_all
    @invoice  = Invoice.find(params[:invoice_id].to_i)
    @journals = @invoice.journals

    delete_journal_ids = @journals.map{|j| j.id} - (params[:belong_journal_ids] || [nil]).map{|s| s.to_i}
    if delete_journal_ids.present?
      delete_journal_ids.each do |journal_id|
        journal = Journal.find(journal_id)
        journal.update_attributes(invoice_id: nil)
      end
    end

    if params[:alone_journal_ids].present?
      params[:alone_journal_ids].map{|s| s.to_i}.each do |journal_id|
        journal = Journal.find(journal_id)
        journal.update_attributes(invoice_id: @invoice.id)
      end
    end

    @invoice.update_summary #need_test!

    redirect_to invoice_path(params[:invoice_id])
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:start_at, :finish_at, :content, :city, :customer_id, :complete, :invoice_id, :user_id)
    end
end
