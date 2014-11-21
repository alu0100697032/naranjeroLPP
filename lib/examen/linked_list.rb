class List
    include Enumerable
    
    attr_accessor :raiz, :tail, :size
    def initialize(valor)
        @raiz = Node.new(valor, nil, nil)
        @tail = @raiz
    end

#Métodos enumerables

    def each 
        var = @raiz
        while var != nil do
            yield var.value
            var = var.next
        end
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
    
    def pop (valor)
        @raiz.previous = Node.new(valor, @raiz, nil)
        @raiz = @raiz.previous
    end
    
#Métodos de borrado
    def shift
        @raiz = @raiz.next
        @raiz.previous = nil
    end
    
    def pull
        @tail = @tail.previous
        @tail.next = nil
    end
    
#to_s
    def to_s 
        var=@raiz
        cadena = nil
        while var.value !=nil do
            cadena += "#{@var.value}\n"
            var=var.next
        end
    end 
end