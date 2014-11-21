class Exam
    
    

    attr_reader :alu, :listaPreguntas, :listaRespuestas, :listaCorrectas, :respuestasCorregidas
    
    def initialize (alu, *preguntas_respuestas)
        @alu = alu
        @listaPreguntas = List.new(preguntas_respuestas[0])
        @listaRespuestas = List.new(preguntas_respuestas[1])
        cont = 2
        while preguntas_respuestas.length > cont 
            @listaPreguntas.push(preguntas_respuestas[cont])
            cont += 1
            @listaRespuestas.push(preguntas_respuestas[cont])
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
        cadena = "#{@alu}\n"
        cadena = cadena + @listaPreguntas.to_s 
        cadena = cadena + @listaRespuestas.to_s 
        cadena
        
    end 
    
    def correcion
        
        var=@listaCorrectas.raiz
        var1=@listaRespuestas.raiz
        if (var.value==var1.value)
            @respuestasCorregidas = List.new(true)
        else
            @respuestasCorregidas = List.new(false)
        end
        var=var.next
        var1=var1.next
        
        while var1 != nil do
            if (var.value==var1.value)
                @respuestasCorregidas.push(true)
            else
                @respuestasCorregidas.push(false)
            end
            var=var.next
            var1=var1.next
        end
        
        
    end 
    
end