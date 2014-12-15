class Naranjero
    attr_reader :altura, :edad, :contador, :arbolVivo
    
    def initialize(altura, edad, contador)
       @edad = edad
       if(@edad >= 100)
            @arbolVivo = false
            @contador = 0
        else
            @arbolVivo = true
            @contador = contador
        end
        @altura = altura
    end
    
    def uno_mas
        @edad = @edad +1
        if(@edad > 100)
            @arbolVivo = false
            @contador = 0
        else
            @altura = @altura + 0.1
            @contador = @edad/5
        end
    end
    
    def recolectar_una
        if(@arbolVivo == false)
                mensaje = "El arbol esta muerto"
        elsif(@contador == 0)
            mensaje = "No hay naranjas"
            elsif(@contador > 0)
                @contador = @contador -1
                mensaje = "La naranja estaba deliciosa"
        end
    end
end