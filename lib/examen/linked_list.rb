Node = Struct.new(:value, :next)
class List
    attr_accessor :lista, :final
    def initialize(valor)
        @lista = [Node.new(valor, nil)]
        @final = @lista.length-1
    end
end