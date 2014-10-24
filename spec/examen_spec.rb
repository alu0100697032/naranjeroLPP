require 'examen'

describe Examen do
    before :each do
        @p1 = Pregunta.new("Enunciado", "a", "b", "c", "d")
    end
    describe "La pregunta es coherente" do
        it "Existe enunciado" do
            @p1.enunciado != nil
        end
        it "Existen respuestas" do
            @p1.respuesta_a != nil
            @p1.respuesta_b != nil
            @p1.respuesta_c != nil
            @p1.respuesta_d != nil
        end
    end
end