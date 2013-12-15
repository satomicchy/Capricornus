# coding: utf-8
Prawn::Document.send(:include, ActionView::Helpers::NumberHelper)

prawn_document(filename: "請求書.pdf", page_size: "A4") do |pdf|
  pdf.instance_exec(@invoice) do |invoice|
    company  = Company.all.first
    bank     = Bank.all.first
    custom   = invoice.custom
    journals = invoice.journals.order("start_at")

    font_families["Kanjikana"] = {:normal => "#{Rails.root}/vendor/assets/fonts/VL-Gothic-Regular.ttf"}

    font "Kanjikana"
    font_size 10
    rubi_font_size = 7

    #title
    title_x = 210
    title_y = 750
    text_box "御請求明細書", at: [title_x, title_y], size: 16
    line [title_x, title_y - 19], [title_x + 96, title_y - 19]
    stroke

    #number & date
    move_down 80
    text "第" + "#{sprintf "%05d", invoice.id}" + "号", align: :right
    move_down 5
    text "#{invoice.ask_on.try(:strftime, "%Y年%m月%d日")}", align: :right

    #company
    move_down 25
    text "#{company.name}", align: :right, size: 12
    move_down 7
    text "〒" + "#{company.zip}", align: :right
    move_down 3
    text "#{company.address}", align: :right
    move_down 3
    if company.fax.present?
      text "TEL:" + "#{company.tel}" + ", FAX:" + "#{company.fax}", align: :right
    else
      text "TEL:" + "#{company.tel}", align: :right
    end

    #custom
    custom_x = 0
    custom_y = 690

    name_size  = 14
    name_width = if (/[a-z]/ =~ "#{custom.name}").blank?
                   "#{custom.name}".size * name_size
                 else
                   "#{custom.name}".size * (name_size / 2)
                 end

    text_box "#{custom.name}" + "　御中", at: [custom_x, custom_y], size: name_size
    line [custom_x, custom_y - 17], [custom_x + name_width + 42, custom_y - 17]
    stroke

    #message
    massage_x = 0
    massage_y = 640
    text_box "下記の通りご請求申し上げます。", at: [massage_x, massage_y]

    #total
    total_table_x = 0
    total_table_y = 615
    bounding_box([total_table_x, total_table_y], width: 230, height: 35) do
      bounding_box([5, 20], width: 100) do
        text "ご請求金額（税込み）", align: :left
      end
      bounding_box([110, 25], width: 130) do
        text "¥#{number_to_currency invoice.summary, :precision => 0, :unit => ""}-", size: 16, align: :center
      end
      transparent(1.0) { stroke_bounds }
    end

    #journal table
    move_down 20
    journal_table = []

    ##title
    journal_table << ["日付", "内容", "数量", "単位", "単価", "金額"]

    ##journals
    journals.each do |journal|
      journal.costs.each_with_index do |cost, i|
        journal_date = i == 0 ? journal.start_at.try(:strftime, "%m/%d") : ""
        journal_table << [journal_date, journal.content, cost.count, I18n.t(cost.unit), "¥" + number_to_currency(cost.unit_price, precision: 0, unit: ""), "¥" + number_to_currency(cost.count * cost.unit_price, precision: 0, unit: "")]
      end
    end

    table journal_table do
      header = cells.columns(0..-1).row(0)
      contents = cells.columns(0..-1).row(1..-1)

      header.background_color = "D0D0D0"
      header_width = [35, 298, 35, 35, 60, 60]
      header.each_with_index do |cell, i|
        cell.width = header_width[i]
        #FIXME! It raises exception when cell text is longer than cell width.
      end
      header.style align: :center

      column = 0
      contents.each do |cell|
        cell.style align: :right if column >= 2
        column < 5 ? column += 1 : column = 0
      end
    end

    #summary table
    summary_table = []

    summary_table << ["合計", "¥" + number_to_currency(invoice.summary, precision: 0, unit: "")]
    summary_table << ["消費税等", "¥0"]
    summary_table << ["合計（税込）", "¥" + number_to_currency(invoice.summary, precision: 0, unit: "")]

    table summary_table, position: 333, column_widths: [130, 60], :cell_style => {align: :right}

    #memo
    memo_x = 0
    memo_y = 100
    text_box "備考", at: [memo_x, memo_y]
    bounding_box([memo_x, memo_y - 15], width: 530, height: 40) do
      bounding_box([5, 35], width: 530) do
        text invoice.memo, align: :left
      end
      transparent(1.0) { stroke_bounds }
    end

    #bank
    bank_x = 0
    bank_y = 35
    text_box "【お振込先】#{bank.name} #{bank.branch} #{I18n.t(bank.type)} #{bank.number} 名義人", at: [bank_x, bank_y], size: 12
    text_box "恐れ入りますが、振込手数料は貴社にてご負担ください。", at: [bank_x + 5, bank_y - 18]
  end
end
