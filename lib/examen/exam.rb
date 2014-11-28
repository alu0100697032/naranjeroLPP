class Exam
    
    attr_reader :listaPreguntas, :listaCorrectas
    
    def initialize (*preguntas)
        @listaPreguntas = List.new(preguntas[0])
        cont = 1
        while preguntas.length > cont 
            @listaPreguntas.push(preguntas[cont])
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