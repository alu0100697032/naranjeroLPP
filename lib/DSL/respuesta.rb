class Respuesta
    
	attr_accessor :tipo, :indice, :respuesta
	
	def initialize(indice, tipo, respuesta)
		@tipo, @indice, @respuesta = tipo, indice, respuesta
	end
	def to_s
		"#{@indice} - #{respuesta}"
	end
	
	def[](index)
	    return self
	end
	
	def is_right?
		@tipo == Quiz::RIGHT
	end
	
	def <=>(other)
		self.indice <=> other.indice
	end
end