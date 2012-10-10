puts 'draft script for rename files'
Dir.glob("./**/**_test.rb").each do |item|
  puts item + " - " + "#{item[0,item.length-7]}spec.rb"
  File.rename(item, "#{item[0,item.length-7]}spec.rb")
end
