#!/usr/bin/ruby -w
require 'roo'
require 'builder'

x = Builder::XmlMarkup.new(:target=>$stdout, :indent=>1)
xlsx = Roo::Spreadsheet.open('./diameter-sh-avp.xlsx')
#xlsx.each_row_streaming(offset: 1) do |row|
xlsx.each(name: 'Attribute Name', code: 'AVP Code', must: "Must", mustnot: "Must not", mayencrypt: "May Encrypt", type: 'Value Type') do |row|
  row["vendor-id"] = "10415"
  x.avp(row.slice(:name, :code, :must, :mustnot, :mayencrypt, "vendor-id")) {x.data(row.slice(:type))}
end
