# coding: utf-8
Prawn::Document.send(:include, ActionView::Helpers::NumberHelper)

prawn_document(filename: "test.pdf", page_size: "A4") do |pdf|
  pdf.instance_exec(@invoice) do |invoice|

    font_families["Kanjikana"] = {:normal => "#{Rails.root}/vendor/assets/fonts/VL-Gothic-Regular.ttf"}

    font "Kanjikana"
    font_size 10
    rubi_font_size = 7

    text_box "てすと"

  end
end

