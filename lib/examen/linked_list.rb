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

    def insert(index, valor)
        @lista.insert(index, Node.new(valor, @lista[index].value))
        if(index - 1 >= 0)
            @lista[index - 1].next = valor
        end
        @final += 1
    end
    
    def insert(index, *valores)
        var = 0
        val = valores
        while val.length > var 
            if(val.length == val.length - 1)
                @lista.insert(index + var, Node.new(valores[var], @lista[index + val.length]))
            else
                @lista.insert(index + var, Node.new(valores[var], valores[var + 1]))
            end
            @lista[index-1].next = @lista[index].value
            var += 1
        end
    end
    
    def unshift(valor)
        @lista.unshift Node.new(valor, @lista[0].value)
        @final += 1
    end
    
#Métodos de borrado
    def shift
        @lista.shift
        @final = final - 1
    end
    
end