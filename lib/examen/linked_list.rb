Node = Struct.new(:value, :next)
class List
    attr_accessor :lista, :final
    def initialize(valor)
        @lista = [Node.new(valor, nil)]
        @final = @lista.length-1
    end

#Métodos de insersión
    def push(valor)
        @lista[@final].next = valor
        @lista.push Node.new(valor, nil)
        @final += 1
    end

#Métodos de borrado
    def shift
        @lista.shift
        @final = final - 1
    end
    
end