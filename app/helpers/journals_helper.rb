module JournalsHelper
  def next_month
    params[:month] ?
      Date.new(params[:year].to_i, params[:month].to_i, 1) + 1.month : Date.today + 1.month
  end

  def prev_month
    params[:month] ?
      Date.new(params[:year].to_i, params[:month].to_i, 1) - 1.month : Date.today - 1.month
  end
end
