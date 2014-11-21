#encoding: UTF-8
class Pregunta 
    include Comparable
    
    attr_reader :enunciado, :respuestas, :dificultad, :respCorrecta
    
    def initialize (enun, *resp, dificultad, respuestaCorrecta)
        @enunciado = enun
        @respuestas = resp 
        @dificultad = dificultad
        @respCorrecta = respuestaCorrecta
    end
    
    def to_s
        mostrar = "#{@enunciado}"
        var = 0
        while var < @respuestas.length
            mostrar = mostrar + " \n " + @respuestas[var].to_s 
            var +=1
        end
        mostrar
    end
    
    def <=> (anOther)
        dificultad <=> anOther.dificultad
    end
    
    def ==(anOther)
        dificultad == anOther.dificultad && @enunciado == anOther.enunciado
    end
 end




