class Link < ActiveRecord::Base
	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    new_row = Hash.new
	    row.each_pair do |k,v|
		   new_row[k.downcase.gsub(' ' , '_')] = v 
		  end
	    link = new(new_row)
	    link.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
		  when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
		  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
		  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
	  	else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
