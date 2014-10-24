class Pregunta 
    
    attr_reader :enunciado, :respuesta_a, :respuesta_b, :respuesta_c, :respuesta_d
    
    def initialize (enun, a, b, c, d)
        @enunciado = enun
        @respuesta_a = a
        @respuesta_b = b
        @respuesta_c = c
        @respuesta_d = d
    end
    
    def to_s
        "#{@enunciado} \n a) #{@respuesta_a} \n b) #{@respuesta_b} \n c) #{@respuesta_c} \n d) #{@respuesta_d}"
    end
    
end