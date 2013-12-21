module InvoicesHelper
  def download_ok?(invoice)
    invoice.costs.present? ? true : false
  end
end
