# encoding: UTF-8
require 'examen'
require 'spec_helper'


describe Pregunta do
    before :each do
        @p1 = Pregunta.new("Enunciado", "a", "b", "c", "d", 3, "a")
        @p2 = Pregunta.new("Enunciado", "a", "b", "c", "d", 2, "a")
        @p3 = Pregunta.new("Enunciado", "a", "b", "c", "d", 4, "a")
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
    it "probando to_s" do
      @l1.push("Pregunta 1")
      expect(@l1.to_s).to eq("Raiz\nPregunta 1\n")
    end
    it "Invertir lista" do
      @l1.insert(1,2,3,4)
      expect(@l1.invertirOrden.raiz.next.value).to eq(3)
    end
  end
end

describe Examen do   
  describe "Relacion de preguntas" do
      before :each do
        @p1 = Pregunta.new("1.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Xyz \n\t\t def pots \n\t\t\t @nice \n\t\t end \n\t end \n\n\t xyz = Xyz.new \n\t p xyz.pots", "a) #<Xyz:0xa000208>", "b) nil", "c) 0", "d) Ninguna de las anteriores", 5, 0)
        @p2 = Verdadero_Falso.new("2.-) La sigiente definición de un hash en Ruby es válida: \n\t hash_raro = { \n\t\t [1,2,3] => Object.new(), \n\t\t Has.new => :toto \n\t }", 4, 1)
        @p3 = Pregunta.new("3.-) ¿Cuál es la salida del siguiente código Ruby? \n\t class Array \n\t\t def say_hi \n\t\t\t \"HEY!\" \n\t\t end \n\t end \n\t p [1, \"bob\"].say_hi", "a) 1","b) bob","c) hey!","d) Ninguna de las anteriores", 3, 0)
        @p4 = Pregunta.new("4.-) ¿Cuál es el tipo del objeto en el siguiente código Ruby? \n\t class Objeto \n\t end", "a) Una instancia de la clase Class","b) Una constante", "c) Un Objeto","d) Ninguna de las anteriores", 2, 2)
        @p5 = Verdadero_Falso.new("5.-) Es apropiado que una clase Tablero herede de una clase Juego", 1, 1)      
        @lista_preguntas = List.new(@p1)
        @lista_preguntas.insert(@p2, @p3, @p4, @p5)
      end 
      it "Estructura de la lista: la cabeza es correcta" do
        expect(@lista_preguntas.raiz.value).to eq(@p1)
      end
      it "Estructura de la lista: la cola es correcta" do
        expect(@lista_preguntas.tail.value).to eq(@p5)
      end
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
  
describe Exam do
  describe "Examen" do
    before :each do
      @p1 = Pregunta.new("Enunciado 1", "a","b","c",1,0)
      @p2 = Pregunta.new("Enunciado 2", "a","b","c",1,1)
      @p3 = Pregunta.new("Enunciado 3", "a","b","c",1,0)
      @p4 = Pregunta.new("Enunciado 4", "a","b","c",1,2)
      @p5 = Pregunta.new("Enunciado 5", "a","b","c",1,1)
      @e1 = Exam.new(@p1,@p2,@p3,@p4,@p5)
      @lPreguntas = List.new(@p1)
      @lPreguntas.insert(@p2,@p3,@p4,@p5)
      @lCorrectas = List.new(0)
      @lCorrectas.insert(1,0,2,1)
    end
    
    it "Lista Preguntas" do
      expect(@e1.listaPreguntas.to_s).to eq(@lPreguntas.to_s)
    end
    
    it "Lista Respuestas Correctas" do
      expect(@e1.listaCorrectas.to_s).to eq(@lCorrectas.to_s)
    end
    
    it "to_s" do
      expect(@e1.to_s).to eq(@lPreguntas.to_s)
    end
    
    it "Invertir preguntas de un examen mediante proc" do
      expect(@e1.invertir.is_a? Proc).to eq(true)
    end
    
    it "Invertir preguntas de un examen mediante proc" do
      expect(@e1.invertir.call.to_s).to eq(@lPreguntas.invertirOrden.to_s)
    end
  end
end

describe Interfaz do
  describe "Interfaz de Usuario" do
    before :each do
      @p1 = Pregunta.new("Enunciado 1", "a","b","c",1,0)
      @p2 = Pregunta.new("Enunciado 2", "a","b","c",1,1)
      @p3 = Pregunta.new("Enunciado 3", "a","b","c",1,0)
      @p4 = Pregunta.new("Enunciado 4", "a","b","c",1,2)
      @p5 = Pregunta.new("Enunciado 5", "a","b","c",1,1)
      @r1 = 0
      @r2 = 1
      @r3 = 0
      @r4 = 2
      @r5 = 1
      @e1 = Exam.new(@p1,@p2,@p3,@p4,@p5)
      @lRespuestas = List.new(0)
      @lRespuestas.insert(1,0,2,1)
      @lCorregidas = List.new(true)
      @lCorregidas.insert(true,true,true,true)
      @alu = "Alu0100837353"
      @i1 = Interfaz.new(@alu,@e1,@r1,@r2,@r3,@r4,@r5)
    end
    it "Alu" do
      expect(@i1.alu).to eq(@alu)
    end
    
    it "Examen" do
      expect(@i1.examen).to eq(@e1)
    end
    
    it "Lista Respuestas del Alu" do
      expect(@i1.listaRespuestas.to_s).to eq(@lRespuestas.to_s)
    end
    
    it "Lis de respuestas Corregidas" do
      @i1.correcion
      expect(@i1.respuestasCorregidas.to_s).to eq(@lCorregidas.to_s)
    end
    
    it "to_s" do
      expect(@i1.to_s).to eq("Alu0100837353\n"+@p1.to_s+"\n"+@r1.to_s+"\n"+"true"+"\n"+@p2.to_s+"\n"+@r2.to_s+"\n"+"true"+"\n"+@p3.to_s+"\n"+@r3.to_s+"\n"+"true"+"\n"+@p4.to_s+"\n"+@r4.to_s+"\n"+"true"+"\n"+@p5.to_s+"\n"+@r5.to_s+"\n"+"true"+"\n")
    end
    
  end
end

describe Naranjero do
  describe "Clase Naranjero"do
   before :each do
     #recibe los parámetros altura, edad y contador
    @n1 = Naranjero.new(100, 1, 0)
    @n2 = Naranjero.new(1, 5, 1)
    @n3 = Naranjero.new(5, 100, 20)
    @n4 = Naranjero.new(50, 20, 50)
   end
   it "Atributos"do
     expect(@n1.altura).to eq(100)
     expect(@n1.edad).to eq(1)
     expect(@n1.contador).to eq(0)
     expect(@n1.arbolVivo).to eq(true)
   end
   it "uno_mas"do
    @n1.uno_mas
    expect(@n1.altura).to eq(101)
    expect(@n1.edad).to eq(2)
    expect(@n1.contador).to eq(0)
   end
   it "uno_mas el árbol muere"do
    @n3.uno_mas
    expect(@n3.altura).to eq(5)
    expect(@n3.edad).to eq(101)
    expect(@n3.contador).to eq(0)
    expect(@n3.arbolVivo).to eq(false)
   end
   it"No hay naranjas"do
    expect(@n1.recolectar_una).to eq("No hay naranjas")
    expect(@n1.contador).to eq(0)
   end
   it"La naranja estaba deliciosa"do
    expect(@n2.recolectar_una).to eq("La naranja estaba deliciosa")
    expect(@n2.contador).to eq(0)
   end
   it"El árbol está muerto"do
    expect(@n3.recolectar_una).to eq("El arbol esta muerto")
   end
   it"Hilo para hacer crecer el arbol"do
     Thread.new {10.times {@n1.uno_mas; sleep(0.1); "El arbol esta creciendo"}}.join
     expect(@n1.edad).to eq (11)
   end 
   it"Hilo para recolectar del arbol"do
     Thread.new {10.times {@n4.recolectar_una; sleep(0.1); "Recolectando"}}.join
     expect(@n4.contador).to eq (40)
   end 
   it "prueba" do
     #@n1.simulaTraza
     #expect(@n1.edad).to eq(101)
    end
    
  end
  end
  
describe Respuesta do
		before :all do
			@respuesta1 = Respuesta.new(1, :RIGHT, "7")
			@respuesta2 = Respuesta.new(2, :WRONG, "9")
		end
		
		it "Se comprueba la clase del objeto" do
			expect(@respuesta1.is_a?(Respuesta)).to eq(true)
			expect(@respuesta2.is_a?(Respuesta)).to eq(true)
		end
		
		it "La respuesta se muestra correctamente" do
			expect(@respuesta1.to_s).to eq("1 - 7")
			expect(@respuesta2.to_s).to eq("2 - 9")
		end
end
	
describe Question do
		before :all do
			@respuesta1 = Respuesta.new(1, :right, "7")
			@respuesta2 = Respuesta.new(2, :wrong, "9")
			@respuesta3 = Respuesta.new(3, :wrong, "4")
			@respuesta4 = Respuesta.new(4, :wrong, "3")
			@respuestas = Array.new(4)
			@respuestas[0] = @respuesta1
			@respuestas[1] = @respuesta2
			@respuestas[2] = @respuesta3
			@respuestas[3] = @respuesta4
			@pregunta1 = Question.new("3+4", @respuestas)
			
		end
		
		it "Se comprueba la clase del objeto" do
			
			expect(@pregunta1.is_a?(Question)).to eq(true)
		end
		
		it "La pregunta es la esperada" do
			expect(@pregunta1.text).to eq("3+4")
		end
end
	
describe Quiz do
		before :all do
			@quiz = Quiz.new("Cuestionario de LPP 19/12/2014") {
			question "¿Cuantos argumentos de tipo bloque puede recibir un metodo?",
				right =>'1',
				wrong =>'2',
				wrong =>'muchos',
				wrong =>'los que defina el usuario'
			
			question "En Ruby los bloque son objetos que continen codigo",
				wrong =>'Cierto',
				right =>'Falso'
			}
		end
		
		it "Nombre" do
		  expect(@quiz.name).to eq("Cuestionario de LPP 19/12/2014")
		end
		
	end  
end 
