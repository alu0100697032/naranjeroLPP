# encoding: UTF-8
require 'examen'
require 'spec_helper'


describe Examen do
    before :each do
        @p1 = Pregunta.new("Enunciado", "a", "b", "c", "d")
    end
    describe "La pregunta es coherente" do
        it "Existe enunciado" do
            expect(@p1.enunciado).not_to eq(nil)
        end
        it "Existen respuestas" do
          var =0
            while var < @p1.respuestas.length 
              expect(@p1.respuestas[var]).not_to eq(nil)
              var +=1
            end
        end
    end
    
    describe "Getter de enunciado" do
      it "Devuelve el valor de p1.enunciado" do
        expect(@p1.enunciado).to eq("Enunciado")
      end
  end
  
  describe "Getter de respuestas" do  
      it "Devuelve el valor de p1.respuestas" do
        expect(@p1.respuestas).to eq(["a", "b", "c", "d"])
      end
  end
  
  describe "to_s" do
      it "Se debe mostrar por consola las pregunta y las respuestas" do
        expect(@p1.to_s).to eq("Enunciado \n a \n b \n c \n d")
      end
  end
end

describe Examen do
  before :each do
    @l1 = List.new("Raiz")
  end
  describe "Node" do 
    it "Debe existir un Nodo de la lista con sus datos y su siguiente" do 
      expect(@l1.raiz.value).not_to eq(nil)
      expect(@l1.raiz.next).to eq(nil)
    end
  end
  describe "List" do 
    it "Se extrae el primer elemento de la lista" do 
      @l1.push(8)
      @l1.shift
      expect(@l1.raiz.value).to eq(8)
    end
    it "Se puede insertar un elemento" do 
      @l1.push(8)
      expect(@l1.tail.value).to eq(8)
    end
    it "Se pueden insertar varios elementos" do 
      @l1.insert(3,4,5)
      expect(@l1.tail.value).to eq(5)
    end
    it "Debe existir una lista con su cabeza" do 
      expect(@l1.raiz.value).to eq("Raiz")
    end
    it "La lista está doblemente enlazada" do 
      @l1.insert(8, 7, 6)
      expect(@l1.tail.previous.previous.value).to eq(8) 
    end
  end
end

describe Examen do   
  describe "Relacion de preguntas" do
      before :each do
      @p1 = Pregunta.new("1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots", "a) #<Xyz:0xa000208>", "b) nil", "c) 0", "d) Ninguna de las anteriores")
     @p2 = Verdadero_Falso.new("2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t }")
      @p3 = Pregunta.new("3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi", "a) 1","b) bob","c) hey!","d) Ninguna de las anteriores")
      @p4 = Pregunta.new("4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end","a) Una instancia de la clase Class","b) Una constante","c) Un Objeto","d) Ninguna de las anteriores")
      @p5 = Verdadero_Falso.new("5.-) Es apropiado que una clase Tablero herede de una clase Juego")      
      end 
      it "Enunciado y respuestas pregunta 1" do
        expect(@p1.enunciado).to eq("1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots")
        expect(@p1.respuestas[0]).to eq("a) #<Xyz:0xa000208>")
        expect(@p1.respuestas[1]).to eq("b) nil")
        expect(@p1.respuestas[2]).to eq("c) 0")
        expect(@p1.respuestas[3]).to eq("d) Ninguna de las anteriores")
        expect(@p1.to_s).to eq("1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots \n a) #<Xyz:0xa000208> \n b) nil \n c) 0 \n d) Ninguna de las anteriores")
      end
      it "Enunciado y respuestas pregunta 2" do
        expect(@p2.enunciado).to eq("2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t }")
        expect(@p2.respuestas[0]).to eq("a) Cierto")
        expect(@p2.respuestas[1]).to eq("b) Falso")
        expect(@p2.to_s).to eq("2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t } \n a) Cierto \n b) Falso")
      end 
      it "Enunciado y respuestas pregunta 3" do
        expect(@p3.enunciado).to eq("3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi")
        expect(@p3.respuestas[0]).to eq("a) 1")
        expect(@p3.respuestas[1]).to eq("b) bob")
        expect(@p3.respuestas[2]).to eq("c) hey!")
        expect(@p3.respuestas[3]).to eq("d) Ninguna de las anteriores")
        expect(@p3.to_s).to eq("3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi \n a) 1 \n b) bob \n c) hey! \n d) Ninguna de las anteriores")
      end 
      it "Enunciado y respuestas pregunta 4" do
        expect(@p4.enunciado).to eq("4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end")
        expect(@p4.respuestas[0]).to eq("a) Una instancia de la clase Class")
        expect(@p4.respuestas[1]).to eq("b) Una constante")
        expect(@p4.respuestas[2]).to eq("c) Un Objeto")
        expect(@p4.respuestas[3]).to eq("d) Ninguna de las anteriores")
        expect(@p4.to_s).to eq("4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end \n a) Una instancia de la clase Class \n b) Una constante \n c) Un Objeto \n d) Ninguna de las anteriores")
      end 
      it "Enunciado y respuestas pregunta 5" do
        expect(@p5.enunciado).to eq("5.-) Es apropiado que una clase Tablero herede de una clase Juego")
        expect(@p5.respuestas[0]).to eq("a) Cierto")
        expect(@p5.respuestas[1]).to eq("b) Falso")
        expect(@p5.to_s).to eq("5.-) Es apropiado que una clase Tablero herede de una clase Juego \n a) Cierto \n b) Falso")
      end 
  end
end 