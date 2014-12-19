class Question
	INDEX = 0
	TIPE = 1

	attr_accessor :text, :answers

	def initialize(text, answers)
		@text = text
		@answers = answers.map { |k, v| Respuesta.new(k[INDEX], k[TIPE], v) }.sort
	end

	def to_s
		
		out = ""
		out += "#{@text}\n"
		@answers.each do |answer|
			out += " #{answer}\n"
		end
			out
	end

	
end