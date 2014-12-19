class Quiz

	RIGHT = :right
	WRONG = :wrong
	attr_accessor :name, :questions
	def initialize(name = "", &block)
		@name = name
		@questions = []
		@counter = 0
		instance_eval &block
	end

	def question(text, answers)
		q = Question.new(text, answers)
		questions << q
		@counter = 0
	end

	def to_s
		self.name
		self.questions.join("\n")
		
	end

	def wrong
		@counter += 1
		[@counter, WRONG]
	end

	def right
		@counter+= 1
		[@counter, RIGHT]
	end

	def title(title)
		@name = title
	end

	
end