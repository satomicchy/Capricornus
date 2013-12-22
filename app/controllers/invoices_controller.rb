class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def export_pdf
    @invoice = Invoice.find(params[:invoice_id])
    render params[:invoice]
  end

  # GET /invoices
  # GET /invoices.json
  def index
    ongoing_invoices = Invoice.all - Invoice.where("payment = ? OR cancel = ?", true, true)
    @invoices = if params[:custom].present? && params[:ongoing] == "true"
                  ongoing_invoices.where(custom_id: params[:custom].to_i)
                elsif params[:ongoing] == "true"
                  ongoing_invoices
                else
                  Invoice.all
                end
    respond_to do |format|
      format.html
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @journals = @invoice.journals.order("start_at")
    @alone_journals = Journal.where("invoice_id IS NULL").order("start_at")
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: '請求書が登録されました。' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: '請求書が更新されました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:number, :ask_on, :deadline, :custom_id, :memo, :summary, :payment)
    end
end
