require 'nokogiri'

class RequestItem < ApplicationRecord
  def to_html
    @doc = Nokogiri::HTML::DocumentFragment.parse ""
    Nokogiri::HTML::Builder.with(@doc) do |doc|
      doc.div {
        # doc.span self.trap_id
        doc.p "Date: #{r_date}."
        doc.ul {
          # TODO: filter empty header(in trap side) select{|k, p| k.empty?}
          eval(r_data).each {|key, value| doc.li "#{key}: #{value}" }
        }
      }
    end
    @doc.to_html
  end

  def to_s
    "Request: date=#{self.r_date}, data=#{self.r_data}"
  end
end
