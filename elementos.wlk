
import plagas.*

class Hogar{

  var property mugre
  var property confort

  method esBueno() = mugre <= (confort / 2)

  method sufrirAtaque(dañoDePlaga, laPlagaPuedeTransmitirEnfermedades){
    mugre += dañoDePlaga
  }

}

class Huerta{
 
  var property capacidadDeProduccion // kg

  method esBueno() = capacidadDeProduccion > nivelDeProduccion.valor()

  method sufrirAtaque(dañoDePlaga, laPlagaPuedeTransmitirEnfermedades){
    if(laPlagaPuedeTransmitirEnfermedades){
      capacidadDeProduccion -= (dañoDePlaga * 0.1) + 10
    } else {
      capacidadDeProduccion -= (dañoDePlaga * 0.1)
    }
  }

}

object nivelDeProduccion {
  var property valor = 4
}

class Mascota{

  var property nivelSalud

  method esBueno() = nivelSalud > 250 

  method sufrirAtaque(dañoDePlaga, laPlagaPuedeTransmitirEnfermedades){
     if(laPlagaPuedeTransmitirEnfermedades){
      nivelSalud -= dañoDePlaga
    }
  }

}

class Barrio{
  const property elementos 

  method elElemento_EsBueno(unElemento){
    if(!elementos.contains(unElemento)){
      return 
    } else {
      return unElemento.esBueno()
    }
  }

  method esCopado(){
    const elementosBuenos = elementos.count({
      e => e.esBueno()
    })

    const elementosNoBuenos = elementos.count({
      e => !e.esBueno()
    })

    return (elementosBuenos > elementosNoBuenos)
  }
}

const hogar1 = new Hogar(mugre=2, confort=6)
const huerta1 = new Huerta(capacidadDeProduccion=5)
const mascota1 = new Mascota(nivelSalud=200)

const barrio1 = new Barrio(elementos=[hogar1, huerta1])
const barrio2 = new Barrio(elementos=[mascota1])

