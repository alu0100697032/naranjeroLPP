class Verdadero_Falso < Pregunta
    def initialize(enun, dificultad)
        super
        @respuestas = ["a) Cierto", "b) Falso"]
        @dificultad = dificultad
    end
end