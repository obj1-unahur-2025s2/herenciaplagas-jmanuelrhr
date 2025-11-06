import elementos.*

class Plaga{

    var property poblacion

    method puedeTransmitirEnfermedades() = poblacion >= 10

    method nivelDeDaño()

    method efectoTrasAtacar(){
      poblacion += (poblacion * 0.1)
    }

    method atacar(unElemento){

        const dañoDePlaga = self.nivelDeDaño()
        const laPlagaPuedeTransmitirEnfermedades = self.puedeTransmitirEnfermedades()

        unElemento.sufrirAtaque(dañoDePlaga, laPlagaPuedeTransmitirEnfermedades)
        self.efectoTrasAtacar()
    }

}

class Cucarachas inherits Plaga{

    var property pesoPromedio // gramos
    
    override method nivelDeDaño() = poblacion / 2

    override method puedeTransmitirEnfermedades() = super() and pesoPromedio >= 10

    override method efectoTrasAtacar() {
        super() 
        pesoPromedio += 2
    }

}

class Pulgas inherits Plaga{
    
    override method nivelDeDaño() = poblacion * 2

}

class Garrapatas inherits Plaga{
    
    override method nivelDeDaño() = poblacion * 2

    override method efectoTrasAtacar() {
        poblacion += (poblacion * 0.2)
    }

}

class Mosquitos inherits Plaga{
    
    override method nivelDeDaño() = poblacion

    override method puedeTransmitirEnfermedades() = super() and poblacion % 3 == 0
 
}


const plagaDeCucarachas1 = new Cucarachas(poblacion=32, pesoPromedio=6)
const plagaDePulgas1 = new Pulgas(poblacion=56)
const garrapatas1 = new Garrapatas(poblacion=56)