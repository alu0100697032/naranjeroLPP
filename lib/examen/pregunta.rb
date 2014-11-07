#encoding: UTF-8
class Pregunta 
    
    attr_reader :enunciado, :respuestas
    
    def initialize (enun, *resp)
        @enunciado = enun
        @respuestas = resp 
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
    
end




