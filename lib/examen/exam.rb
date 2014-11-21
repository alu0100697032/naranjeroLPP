class Exam
    
    

    attr_reader :alu, :listaPreguntas, :listaRespuestas
    
    def initialize (alu, preguntas, respuestas)
        @alu = alu
        @listaPreguntas = List.new (preguntas[0])
        @listaPreguntas.insert(preguntas[1..(preguntas.length-1)])
        @listaRespuestas = List.new (respuestas[0])
        @listaRespuestas.insert(respuestas[1..(respuestas.length-1)])
    end
    
    def to_s
        cadena = "#{@alu}\n"
        cadena = cadena + @listaPreguntas.to_s 
        cadena = cadena + "\n" 
        cadena = cadena + @listaRespuestas.to_s 
        cadena = cadena + "\n"
        cadena
        
    end 
    
    
end