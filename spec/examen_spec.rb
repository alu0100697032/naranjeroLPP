# encoding: UTF-8
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
      it "Devuelve el valor de p1.enunciado" do
        @p1.enunciado == "Enunciado"
      end
  end
  
  describe "Getter de respuestas" do  
      it "Devuelve el valor de p1.respuestas" do
        @p1.respuestas == ["a", "b", "c", "d"]
      end
  end
  
  describe "to_s" do
      it "Se debe mostrar por consola las pregunta y las respuestas" do
        @p1.to_s == "Enunciado \n a \n b \n c \n d \n"
      end
  end
end

describe Examen do
  before :each do
    @l1 = List.new("Raiz")
  end
  describe "Node" do 
    it "Debe existir un Nodo de la lista con sus datos y su siguiente" do 
      @l1.lista[0].value != nil
      @l1.lista[0].next == nil
    end
  end
  describe "List" do 
    it "Se extrae el primer elemento de la lista" do 
      @l1.shift
      @l1.lista.length.should eq(0) 
    end
    it "Se puede insertar un elemento" do 
      @l1.push(8)
      @l1.lista.length.should eq(2)
    end
    it "Se pueden insertar varios elementos" do 
      @l1.insert(1, 3,4,5)
      @l1.lista.length.should eq(4)
    end
    it "Debe existir una lista con su cabeza" do 
      @l1.lista[0].value == "Raiz"
  end
  end
end

describe Examen do   
  describe "Relacion de preguntas" do
      before :each do
      @p1 = Pregunta.new("1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots", ["a) #<Xyz:0xa000208> ", "b) nil", "c) 0", "d) Ninguna de las anteriores"])
      @p2 = Pregunta.new("2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t }", ["a) Cierto","b) Falso"])
      @p3 = Pregunta.new("3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi", ["a) 1","b) bob","c) hey!","d) Ninguna de las anteriores"])
      @p4 = Pregunta.new("4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end",["a) Una instancia de la clase Class","b) Una constante","c) Un Objeto","d) Ninguna de las anteriores"])
      @p5 = Pregunta.new("5.-) Es apropiado que una clase Tablero herede de una clase Juego",["a) Cierto","b) Falso"])      
      end 
      it "Enunciado y respuestas pregunta 1" do
        @p1.enunciado == "1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots"
        @p1.respuestas[0] == "a) #<Xyz:0xa000208> "
        @p1.respuestas[1] == "b) nil"
        @p1.respuestas[2] == "c) 0 "
        @p1.respuestas[3] == "d) Ninguna de las anteriores"
        @p1.to_s == "¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots \n a) #<Xyz:0xa000208> \n b) nil \n c) 0 \n d) Ninguna de las anteriores"
      end
      it "Enunciado y respuestas pregunta 2" do
        @p2.enunciado == "2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t }"
        @p2.respuestas[0] == "a) Cierto"
        @p2.respuestas[1] == "b) Falso"
        @p2.to_s == "2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t } \n a) Cierto \n b) Falso"
      end 
      it "Enunciado y respuestas pregunta 3" do
        @p3.enunciado == "3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi"
        @p3.respuestas[0] == "a) 1"
        @p3.respuestas[1] == "b) bob"
        @p3.respuestas[2] == "c) hey!"
        @p3.respuestas[3] == "d) Ninguna de las anteriores"
        @p3.to_s == "3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi \n a) 1 \n b) bob \n c) hey! \n d) Ninguna de las anteriores"
      end 
      it "Enunciado y respuestas pregunta 4" do
        @p4.enunciado == "4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end"
        @p4.respuestas[0] == "a) Una instancia de la clase Class"
        @p4.respuestas[1] == "b) Una constante"
        @p4.respuestas[2] == "c) Un Objeto"
        @p4.respuestas[3] == "d) Ninguna de las anteriores"
        @p4.to_s == "4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end \n a) Una instancia de la clase Class \n b) Una constante \n c) Un Objeto \n d) Ninguna de las anteriores"
      end 
      it "Enunciado y respuestas pregunta 5" do
        @p5.enunciado == "5.-) Es apropiado que una clase Tablero herede de una clase Juego"
        @p5.respuestas[0] == "a) Cierto"
        @p5.respuestas[1] == "b) Falso"
        @p5.to_s == "5.-) Es apropiado que una clase Tablero herede de una clase Juego \n a) Cierto \n b) Falso" 
      end 
  end
end 