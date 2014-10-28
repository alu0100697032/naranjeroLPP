#encoding: UTF-8
class Pregunta 
    
    attr_reader :enunciado, :respuestas
    
    def initialize (enun, *resp)
        @enunciado = enun
        @respuestas = resp 
    end
    
    def to_s
        mostrar = "#{@enunciado} \n "
        var = 0
        while var < @respuestas.length
            mostrar = mostrar + @respuestas[var].to_s + " \n "
            var +=1
        end
        puts mostrar
    end
    
end


