import UIKit
// Para no sobreescribir usar la palabra final -> No puede ser modificable
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "Viajandoa \(currentSpeed) km/h"
    }
    
    func makeNoise() {
        // do nothing, porque cada vehículo tiene su
        // propia forma de hacer ruido
        print("El ruido depende del vehiculo")
    }
}

let someVehicle = Vehicle()
print(someVehicle.description)



class Bicycle : Vehicle {
    var hasBasket = false
    
    override func makeNoise() {
        print("Ring Ring")
    }
}


let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15

print(bicycle.description)



class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 3
tandem.currentSpeed = 30

print(tandem.description)


// override -> Sobreescribir

class Train : Vehicle {
    final var numberOfWagons = 0
    
    override func makeNoise() {
        print("Chup Chup")
    }
}


let train = Train()
train.makeNoise() // Se sobreescribe el ruido -> Chup Chup

tandem.makeNoise()  // El ruido depende del vehiculo

bicycle.makeNoise()
tandem.makeNoise()





class Car2 : Vehicle {
    var gear = 1
    override var description : String {
        return super.description +  " en la marcha \(gear)"
    }
}


let car2 = Car2()
car2.currentSpeed = 86
car2.gear = 4
print(car2.description)




class AutomaticCar : Car2 {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 15.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 99
print(automatic.description)





/**
 Ejercicio: Implementar un Override del makenoise en la bicicleta y piensa si el tandem tiene que usar el de la bicicleta, el del padre o uno propio
 Tandem igual que el de la bicicleta por tanto con sobre escribirlo en la bici seria suficiente
 */





/**
 Ejercicio Inheritance
 Heredar gran cantidad de clases de Vehicle y a partir de esas que vayas creando, considerar si se puede heredar alguna más
 Ejemplo: De la clase Vehicle podriamos heredar la clase coche y la clase motocicleta
 tambien se podria heredar la clase barco o barquita .
 Dentro de coche se podria heredar un coche de Formula Uno, coche de calle, tanqueta, furgoneta.
 Dentro de moto se podria tener moto electrica, moto, gasolina, patinete
 Dentro de barco, tener un transatlantico, un yate, barquita
 
 Diferenciar que cosas entre ellas, ejemplo, en las motos la cilindraba, tipo de motor, tipo de combustible , capacidad electrica,
 */


class Car : Vehicle {
    var door : Int = 0
    var year : Int = 0
    var power : String = ""
}

let car = Car()
car.door = 4
print(car.description)


class Motorcycle : Vehicle {
    var wheel: Int = 0
    var displacement : String = ""
}

let motorcycle = Motorcycle()
motorcycle.wheel = 8
print(motorcycle.description)

class Ship : Vehicle {
    var distance: String = ""
    var nodes : String = ""
}

let ship = Ship()
ship.nodes = "8 nodes"
print(ship.description)
