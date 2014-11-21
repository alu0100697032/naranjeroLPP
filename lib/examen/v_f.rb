class Verdadero_Falso < Pregunta
    def initialize(enun, dificultad, respuestaCorrecta)
        super
        @respuestas = ["a) Cierto", "b) Falso"]
        @dificultad = dificultad
        @respCorrecta = respuestaCorrecta
    end
end