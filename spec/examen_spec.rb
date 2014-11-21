# encoding: UTF-8
require 'examen'
require 'spec_helper'


describe Pregunta do
    before :each do
        @p1 = Pregunta.new("Enunciado", "a", "b", "c", "d", 3)
        @p2 = Pregunta.new("Enunciado", "a", "b", "c", "d", 2)
        @p3 = Pregunta.new("Enunciado", "a", "b", "c", "d", 4)
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
  
  ###################PRACTICA 8#########################
  
  describe "La clase es comparable" do
      it "La pregunta 1 es más dificil que la pregunta 2" do
        expect(@p1 > @p2).to eq(true)
      end
      it "La pregunta 2 no es más dificil que la pregunta 1" do
        expect(@p1 < @p2).to eq(false)
      end
      it "La pregunta 2 no es más dificil que la pregunta 1" do
        expect(@p2 < @p1).to eq(true)
      end
      it "La pregunta 2 no es igual de dificil que la pregunta 1" do
        expect(@p1 == @p2).to eq(false)
      end
      it "La pregunta 1 esta entre el nivel 1 y 3" do
        expect(@p1.between?(@p2, @p3)).to eq(true)
      end
  end
end


describe List do
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
    it "La lista está doblemente enlazada" do 
      @l1.insert(8, 7, 6)
      expect(@l1.tail.previous.value).to eq(7) 
    end
    it "La lista está doblemente enlazada" do 
      @l1.insert(8, 7, 6)
      expect(@l1.raiz.previous).to eq(nil) 
    end
    it "La lista está doblemente enlazada: pop" do 
      @l1.pop(1)
      expect(@l1.raiz.value).to eq(1) 
    end
    it "La lista está doblemente enlazada: pull" do 
      @l1.pop(1)
      @l1.pull
      expect(@l1.raiz.value).to eq(1) 
    end
  end
end

describe Examen do   
  #Corregido de la practica 7 :)
  describe "Relacion de preguntas" do
      before :each do
        @p1 = Pregunta.new("1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots", "a) #<Xyz:0xa000208>", "b) nil", "c) 0", "d) Ninguna de las anteriores", 5)
        @p2 = Verdadero_Falso.new("2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t }", 4)
        @p3 = Pregunta.new("3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi", "a) 1","b) bob","c) hey!","d) Ninguna de las anteriores", 3)
        @p4 = Pregunta.new("4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end", "a) Una instancia de la clase Class","b) Una constante", "c) Un Objeto","d) Ninguna de las anteriores", 2)
        @p5 = Verdadero_Falso.new("5.-) Es apropiado que una clase Tablero herede de una clase Juego", 1)      
        @lista_preguntas = List.new(@p1)
        @lista_preguntas.insert(@p2, @p3, @p4, @p5)
      end 
      it "Estructura de la lista: la cabeza es correcta" do
        expect(@lista_preguntas.raiz.value).to eq(@p1)
      end
      it "Estructura de la lista: la cola es correcta" do
        expect(@lista_preguntas.tail.value).to eq(@p5)
      end
      ###################PRACTICA 8#########################
      it "Modulo ENUMERABLE" do
        expect(@lista_preguntas.count).to eq(5)
        expect(@lista_preguntas.max).to eq(@p1)
        expect(@lista_preguntas.min).to eq(@p5)
        expect(@lista_preguntas.sort).to eq([@p5,@p4,@p3,@p2,@p1])
        expect(@lista_preguntas.drop(4)).to eq([@p5])
        expect(@lista_preguntas.first).to eq(@p1)
        expect(@lista_preguntas.take(2)).to eq([@p1,@p2])
      end
  end
  
describe Examen do   
  describe "Relacion de preguntas" do
      before :each do 
        @p1 = Pregunta.new("1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots", "a) #<Xyz:0xa000208>", "b) nil", "c) 0", "d) Ninguna de las anteriores", 5)
        @p2 = Verdadero_Falso.new("2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t }", 4)
        @p3 = Pregunta.new("3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi", "a) 1","b) bob","c) hey!","d) Ninguna de las anteriores", 3)
        @p4 = Pregunta.new("4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end", "a) Una instancia de la clase Class","b) Una constante", "c) Un Objeto","d) Ninguna de las anteriores", 2)
        @p5 = Verdadero_Falso.new("5.-) Es apropiado que una clase Tablero herede de una clase Juego", 1)
        @r1 = 0
        @r2 = 1
        @r3 = 0 
        @r4 = 2 
        @r5 = 1
        @ex1 = Exam.new("Alu", [@p1, @p2, @p3, @p4, @p5], [@r1, @r2, @r3, @r4, @r5])
      end
      it "Comportamiento del to_s"do 
        expect(@ex1.to_s).to eq("alu0100697032 \n Preguntas Respuestas")
      end
   end
end
end 