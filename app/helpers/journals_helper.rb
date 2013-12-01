module JournalsHelper
  def next_month
    params[:month] ?
      Date.new(params[:year].to_i, params[:month].to_i, 1) + 1.month : Date.today + 1.month
  end

  def prev_month
    params[:month] ?
      Date.new(params[:year].to_i, params[:month].to_i, 1) - 1.month : Date.today - 1.month
  end

  def edit_ok?
    @journal.invoice_id.present? && Invoice.find(@journal.invoice_id).payment == true
  end
end
