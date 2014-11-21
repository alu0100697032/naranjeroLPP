class Exam
    
    

    attr_reader :alu, :listaPreguntas, :listaRespuestas, :respuestasCorregidas
    
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
        
    end
    
    def to_s
        cadena = "#{@alu}\n"
        cadena = cadena + @listaPreguntas.to_s 
        cadena = cadena + @listaRespuestas.to_s 
        cadena
        
    end 
    
    def correcion
        var = @listaPreguntas.raiz
        respuestasCorrectas = nil
        while var != nil do
            respuestasCorrectas.push(@listaPreguntas.value.respCorrecta)
            var = var.next
        end
        cont = 0
        while respuestasCorrectas.length > cont do
            if(respuestasCorrectas[cont]==@listaRespuestas[cont])
                respuestasCorregidas.push(true)
            else
                respuestasCorregidas.push(false)
            end 
        cont +=1
        
        end
        
    end 
    
end