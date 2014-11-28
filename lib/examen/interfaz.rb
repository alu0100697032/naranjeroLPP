class Interfaz
    attr_reader :alu, :examen, :listaRespuestas, :respuestasCorregidas
    
    def initialize(alu, exam, *listaRespuestasAlumno)
        @alu = alu
        @examen = exam
        @listaRespuestas = List.new(listaRespuestasAlumno[0])
        cont = 1
        while listaRespuestasAlumno.length > cont 
            @listaRespuestas.push(listaRespuestasAlumno[cont])
            cont += 1
        end
    end
    
    
    def correcion
        
        var=@examen.listaCorrectas.raiz
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
    
    def to_s
        correcion
        cadena = "#{@alu}\n"
        
        var1 = @examen.listaPreguntas.raiz
        var2 = @listaRespuestas.raiz
        var3 = @respuestasCorregidas.raiz
        
        while var1 != nil do 
            cadena = cadena + var1.value.to_s + "\n"
            cadena = cadena + var2.value.to_s + "\n"
            cadena = cadena + var3.value.to_s + "\n"
            var1 = var1.next
            var2 = var2.next
            var3 = var3.next
        end
        cadena
        
    end
end