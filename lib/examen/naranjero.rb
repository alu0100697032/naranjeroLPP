require 'thread'

class Naranjero
    attr_reader :altura, :edad, :contador, :arbolVivo, :produccion
    
    def initialize(altura, edad, contador)
       @edad = edad
       #si el arbol pasa de 100 años muere
       if(@edad >= 100)
            @arbolVivo = false
            @contador = 0
        else
            @arbolVivo = true
            @contador = contador
            @produccion = produccion
        end
        @altura = altura
    end
    
    def uno_mas
        @edad = @edad +1
        #se comprueba si el arbol ha pasado de 100 años 
        if(@edad >= 100)
            @arbolVivo = false
            @contador = 0
        else
            @altura = @altura + 1
            @contador = @edad/5
            @produccion = @contador
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
    
    def crecer
        if(arbolVivo)
            uno_mas
            sleep(0.0001)
        else
            arbolVivo
        end
    end
   
    def recolectar 
        
        recolectar_una
        sleep(0.0001) 
    end
    
    def thread 
        t1 = Thread.new{(100-@edad).times {crecer; puts "creciendo"; puts "#{@contador}"}}
        t2 = Thread.new{(@produccion).times {recolectar; puts "recolectando";puts "#{@contador}"}}
        t1.join
        t2.join
   
    end
    
    
end