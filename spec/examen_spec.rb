require 'examen'

describe Examen do
    before :each do
        @p1 = Pregunta.new("Enunciado", ["a", "b", "c", "d"])
    end
    describe "La pregunta es coherente" do
        it "Existe enunciado" do
            @p1.enunciado != nil
        end
        it "Existen respuestas" do
          var =0
            while var < @p1.respuestas.length 
              @p1.respuestas[var] != nil
              var +=1
            end
        end
    end
    
    describe "Getter de enunciado" do
      it "devuelve el valor de p1.enunciado" do
        @p1.enunciado == "Enunciado"
      end
  end
  
  describe "Getter de respuestas" do  
      it "devuelve el valor de p1.respuestas" do
        @p1.respuestas == ["a", "b", "c", "d"]
      end
  end
  
  describe "to_s" do
      it "Se debe mostrar por consola las pregunta y las respuestas" do
        @p1.to_s == "Enunciado \n a \n b \n c \n d \n"
      end
  end
end


