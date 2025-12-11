import UIKit


struct FixedLengthRange {
    var firstValue : Int
    let length : Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// Si se cambia de var a let muestra error porque no se puede cambiar la propiedad de una constante
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

// rangeOfFourItems.firstValue = 5 -> Error por ser let


class DataImporter {
    var filename = "data.txt"
}
// lazy, crear variables "vaga", hasta que no se emplea no se inicializa
class DataManager {
    lazy var importer = DataImporter()
    var data = [String] ()
}

let manager = DataManager()
manager.data.append("Algo de información")
manager.data.append("Muchos más datos")
manager //importer tiene un valor nil
// Hasta esta línea, el importer no ha sido creado...
manager.importer.filename
// Aquí, la variable importer ya ha sido creada
manager // importer tiene el valor de data.txt




// Computed Properties

/* Permiten ser cambiadas automaticamente por parte del getter o el setter
 No estas obligado a inicializarla cuando crras la estructura o la clase
 */
struct Point {
    var x = 0.0 , y  = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            // let centerX = origin.x + size.width / 2
            // let centerY = origin.y + size.height / 2
            // return Point(x: centerX, y: centerY)
            // Refactorizar
            Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
        }
        // Se puede prescindir de newCenter y colocar newValue
        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
square.center

let initialSquareCenter = square.center
square.center = Point(x: 20, y: 20)

// Quitando el get, esa variable se convierte a solo lectura
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let cuboid = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
cuboid.volume // result -> 40

//cuboid.volume = 57.0 -> Error, puesto que la variable es de solo lectura


// Ejercicio persona que saluda

enum Languague {
    case español
    case inglés
    case frances
}

enum Gender {
    case masculino
    case femenino
}

struct Person {
    var name: String
}

struct Greetings {
    var person: Person
    var languague: Languague
    var gender: Gender
    var languageGreeting: String {
        switch self.languague {
        case Languague.español:
            return "Hola "
        case Languague.inglés:
            return "Hello "
        case Languague.frances:
            return "Bonjour"
        }
    }
    
    var abreSaludo: String {
        switch self.gender {
        case Gender.masculino:
            return languageGreeting + "Mr. \(person.name)"
        case Gender.femenino:
            return languageGreeting  + "Mrs. \(person.name)"
        }
    }
    
}

let names = Person(name: "Lucas")
let user1 = Greetings(person: names, languague: .inglés, gender: .masculino)
user1.abreSaludo




// willSet (presencia futuro) -> Justo antes de cambiar el valor de una propiedad
// didSet (presencia Pasado) -> Después de cambiar el valor de una propiedad

class StepCounter {
    var totalSteps: Int = 0 {
        // Se ejecuta antes de cambiar el totalSteps
        willSet(newTotalSteps) {
            print("El número de pasos va a subir hasta \(newTotalSteps)")
        }
        // Se ejecuta despues de cambiar el totalSteps
        didSet {
            if totalSteps > oldValue {
                print("El número de pasos ha incrementado en \(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 500


stepCounter.totalSteps += 1254


// Ejercicio
/*
 Definir una clase, que tuviera una propiedad llamada la vida del usuario o del jugador
 y añadirle dos observer para chequear si la vida se encuentra dentro de un rango (0 - 100)
 si pasa de 100 corregir la variable para que no se pueda pasar de 100 (maximo valor: 100)
 por el contratio si la vida baja de cero, indicar "Game Over"
 */


class lifeOfPlayer {
    var minimumLife =  0
    var maximunLife = 100
    var lifePlayerOne: Int = 100 {
        willSet(newLifeOfPlayer) {
            if (newLifeOfPlayer <= minimumLife){
               return print("Game Over")
                
            } else if (newLifeOfPlayer > maximunLife) {
                print("Has superado el máxmimo valor de vida: \(maximunLife)")
                return maximunLife = 100
            }
        }
        didSet {
            switch lifePlayerOne {
            case 80..<100:
                print("Dispones de suficiente vida")
            case 1...5:
                print("Dispones de poca vida")
            case 0:
                return print("Game Over")
            case 50:
                print ("Resiste, que llevas la mitad gastada")
            case 100:
                print("A full de vida")
            default:
                if (lifePlayerOne <= 0) {
                    print("Finliza el juego")
                }else {
                    print("El juego continua")
                }
                
            }
        }
    }
}

let playerOne = lifeOfPlayer()
playerOne.lifePlayerOne = 88 // Dispones de suficiente  vida
playerOne.lifePlayerOne = 102 // Has superado el máximo valor de vida //\\ El juego continua
playerOne.lifePlayerOne = 0 // Game Over //\\ Finaliza el juego
playerOne.lifePlayerOne = -15 // Game Over //\\ Finaliza el juego


// las estaticas estaran compartidas por toda la estructura, clase enumerado
// Comun a todas las instancias de esta estructura
struct someStruct {
    var counter = 0
    static var storedTypeProperty = "SOME VALUE"
    static var computedTypeProperty: Int {
        return 1
    }
}

var instanceStr = someStruct()
var otherInstanceStr = someStruct()

// Para acceder a cualquiera de las propiedades estaticas

someStruct.computedTypeProperty


enum SomeEnum {
    static var storedTypeProperty = "SOME VALUE"
    static var computedTyprProperty: Int {
        return 5
    }
}

SomeEnum.storedTypeProperty



class SomeClass {
    static var storedTypeProperty = "SOME VALUE"
    static var computedTyprProperty: Int {
        return -6
    }
    class var overrideableComputedTypeProperty: Int {
        return 120
    }
}

// Todas estas propiedades son compartidasde una instacia de una clase, estructura o enumerado


// Ejercicio

/*
 Funcion con variables estaticas en la que exista un contador de dinero para una familia
 */

class FamilyMoney {
    static var money = 0
    var name = ""
    
    func transaction(Quantity: Int, depositMoney: Bool) {
        if depositMoney {
            FamilyMoney.money += Quantity
            print("\(name), ha ingresado \(Quantity) € en la cuenta común")
        } else {
            FamilyMoney.money -= Quantity
            print("\(name), ha retirado \(Quantity) € en la cuenta común")
        }
    }
}


let transaction1 = FamilyMoney()
let transaction2 = FamilyMoney()

transaction1.name = "Lucas"
transaction2.name = "Blanca"

transaction1.transaction(Quantity: 500, depositMoney: true)
transaction2.transaction(Quantity: 200, depositMoney: false)
