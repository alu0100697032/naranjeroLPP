class Exam
    
    attr_reader :listaPreguntas, :listaCorrectas
    
    def initialize (*preguntas)
        @alu = alu
        @listaPreguntas = List.new(preguntas_respuestas[0])
        cont = 1
        while preguntas.length > cont 
            @listaPreguntas.push(preguntas_respuestas[cont])
            cont += 1
        end
        
        var = @listaPreguntas.raiz
        @listaCorrectas = List.new(var.value.respCorrecta)
        var = var.next
        while var != nil do
            @listaCorrectas.push(var.value.respCorrecta)
            var = var.next
        end
    end
    
    def to_s
        cadena = @listaPreguntas.to_s 
        cadena
        
    end 
    
end