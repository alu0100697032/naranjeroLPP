Node = Struct.new(:value, :next, :previous)
class List
    attr_accessor :raiz, :tail, :size
    def initialize(valor)
        @raiz = Node.new(valor, nil, nil)
        @tail = @raiz
    end

#Métodos de insersión
    def push(valor)
        @tail.next = Node.new(valor, nil, @tail)
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
        @raiz.previous = nil
    end
    
end