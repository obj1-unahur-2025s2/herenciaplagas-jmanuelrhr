import elementos.*

class Plaga{

    const property poblacion

    method puedeTransmitirEnfermedades() = poblacion >= 10

    method nivelDeDaño()

    method atacar(unElemento){

        const dañoDePlaga = self.nivelDeDaño()
        const laPlagaPuedeTransmitirEnfermedades = self.puedeTransmitirEnfermedades()

        unElemento.sufrirAtaque(dañoDePlaga, laPlagaPuedeTransmitirEnfermedades)
    }

}

class Cucarachas inherits Plaga{

    const property pesoPromedio // gramos
    
    override method nivelDeDaño() = poblacion / 2

    override method puedeTransmitirEnfermedades() = super() and pesoPromedio >= 10

}

class Pulgas inherits Plaga{
    
    override method nivelDeDaño() = poblacion * 2

}

class Garrapatas inherits Plaga{
    
    override method nivelDeDaño() = poblacion * 2

}

class Mosquitos inherits Plaga{
    
    override method nivelDeDaño() = poblacion

    override method puedeTransmitirEnfermedades() = super() and poblacion % 3 == 0
 
}


const plagaDeCucarachas1 = new Cucarachas(poblacion=32, pesoPromedio=6)
const plagaDePulgas1 = new Pulgas(poblacion=56)