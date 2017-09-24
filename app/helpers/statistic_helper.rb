module StatisticHelper
  def self.to_html request_item
    doc = Nokogiri::HTML::DocumentFragment.parse ""
    Nokogiri::HTML::Builder.with(doc) do |doc|
      doc.div {
        doc.p "Date: #{request_item.r_date}."
        doc.ul {
          eval(request_item.r_data).each {|key, value| doc.li "#{key}: #{value}"}
        }
      }
    end
    doc.to_html
  end
end
