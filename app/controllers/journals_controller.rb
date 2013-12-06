class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  # GET /journals
  # GET /journals.json
  def index
    date = params[:month] ? Date.new(params[:year].to_i, params[:month].to_i, 1) : Date.today
    @journals = Journal.current_month(date).order("start_at")
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    @costs = @journal.costs
  end

  # GET /journals/new
  def new
    @journal = Journal.new
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)

    respond_to do |format|
      if @journal.save
        format.html { redirect_to @journal, notice: 'Journal was successfully created.' }
        format.json { render action: 'show', status: :created, location: @journal }
      else
        format.html { render action: 'new' }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Journal was successfully updated.' }
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
      params.require(:journal).permit(:start_at, :finish_at, :content, :city, :custom_id, :complete, :invoice_id, :user_id)
    end
end
