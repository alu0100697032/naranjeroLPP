class Naranjero
    attr_reader :altura, :edad, :contador
    
    def initialize(altura, edad, contador)
        @altura = altura
        @edad = edad
        @contador = contador
    end
    
    def uno_mas
        @altura = @altura + 0.1
        @edad = @edad + 1
        @contador = @edad/5
    end
end