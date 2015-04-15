class Table
	attr_accessor :rows,:columns
	def initialize(r,c)
		@rows=r
		@columns=c
		puts "Table Created.R:#{rows},C:#{columns}"
	end
end