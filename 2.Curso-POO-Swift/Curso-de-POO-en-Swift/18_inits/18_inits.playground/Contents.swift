import UIKit

struct Fahrenheit {
    var temperature : Double  // 32
    
    init (){
        self.temperature = 32
    }
}
// Si ni se inicializa y se llama a la funcion rompre y con el Init se solventa o iniciarlizar la variable
var f1 = Fahrenheit()


struct Celsius {
    var temperature : Double
    
    init (fromFahrenheit fahrenheit: Double){
        self.temperature = (fahrenheit - 32) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        self.temperature = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        self.temperature = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212)
let freezingPointOfWQater = Celsius(fromKelvin: 273.15)




struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double){
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1, green: 0, blue: 1)
let halfGrey = Color(white: 0.5)
let green = Color(red: 0,green: 1,blue: 0)


let bodyTemperature = Celsius(37) // con la barra "_" evitamos el volver  aponer celsius


class SurveyQuestion {
    let text : String
    var response: String? // Deja de ser obligatorio iniciarlizar "?"
    
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let q1 = SurveyQuestion(text: "¿Te gustan los BMW?")
q1.ask()
q1.response = "Si, disfruto de ellos"


/**
 Ejercicio 1, tomar la clase Pregunta que hemos elaborado en clase y formular una serie de preguntas
 ¿Cual es tu edad?, ¿Cual es tu clase favorita en Platzi?
 ¿Quien es tu instructor favorito?
 */

let q2 = SurveyQuestion(text: "¿Cual es tu edad?")
q2.ask()
q2.response = "Mi edad es de 25 años"

let q3 = SurveyQuestion(text: "¿Cual es tu clase favorita?")
q3.ask()
q3.response = "La Clase de IOS Native"

let q4 = SurveyQuestion(text: "¿Quien es tu instructor favorito?")
q4.ask()





// Constructores Designados o de Convenencia

// Designado  -> Designado de la suoer clase
// Convenencia -> Otro init de la misma clase
// El último init que se llame siempre debe ser designado


class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) ruedas"
    }
}


let vehicle = Vehicle()
vehicle.description


class Bicycle: Vehicle { // Designado -> Super
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description

// Conveniencia -> Por el Color (solo afecta a dicha clase)
class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // aquí se llama implícitamente a super.init()
    }
    override var description: String {
        return "\(super.description) en el color \(self.color)"
    }
}

let hoverboard = Hoverboard(color: "Silver")
hoverboard.description



enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(Symbol: Character) { // Se coloca un "?" por el return del nil
        switch Symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let someUnit = TemperatureUnit(Symbol: "F")
let someUnit1 = TemperatureUnit(Symbol: "P")


class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class cartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int ) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}


if let someSocks = cartItem(name: "Socks", quantity: 2){
    print("\(someSocks.name) - \(someSocks.quantity)")
}



class Bank {
    static var coinsInBank = 2_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}


class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        self.coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
   

var playerOne: Player? = Player(coins: 1000)

Bank.coinsInBank

playerOne!.win(coins: 3_000)
Bank.coinsInBank

playerOne = nil
Bank.coinsInBank
