Node = Struct.new(:value, :next)
class List
    attr_accessor :raiz, :tail
    def initialize(valor)
        @raiz = Node.new(valor, nil)
        @tail = @raiz
    end

#Métodos de insersión
    def push(valor)
        @tail.next = Node.new(valor, nil)
        @tail = @tail.next
    end
    
    def insert(*valores)
        var = 0
        val = valores
        while val.length > var 
            push(val[var])
            var += 1
        end
    end
    
#Métodos de borrado
    def shift
        @raiz = @raiz.next
    end
    
end