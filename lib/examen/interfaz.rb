class Interfaz
    attr_reader :examen
    
    def initialize(exam)
        @examen = exam
    end
    
    def to_s
        @examen.correcion
        cadena = "#{@examen.alu}\n"
        
        var1 = @examen.listaPreguntas.raiz
        var2 = @examen.listaRespuestas.raiz
        var3 = @examen.respuestasCorregidas.raiz
        
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