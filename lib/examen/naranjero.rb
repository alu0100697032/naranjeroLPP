class Naranjero
    attr_reader :altura, :edad, :contador, :arbolVivo
    
    def initialize(altura, edad, contador)
        @altura = altura
        @edad = edad
        @contador = contador
        if(@edad > 100)
            @arbolVivo = false
        else 
            @albolVivo = true
       end
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
end