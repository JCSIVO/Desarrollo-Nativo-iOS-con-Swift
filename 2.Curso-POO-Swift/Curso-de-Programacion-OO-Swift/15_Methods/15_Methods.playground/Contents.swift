import UIKit

// self -> propiedade de la misma clase // Significa de mi mismo
class Counter {
    var count = 0
    
    func increment() {
        self.count += 1
    }
    
    func increment(by amount: Int) {
        self.count += amount
    }
    
    func reset() {
        self.count = 0
    }
}

let counter = Counter()

counter.increment()

counter.increment(by: 8)

counter.reset()



struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRight(of x: Double) -> Bool {
        return self.x > x
    }
    /*
     Una funcion no puede cambiar losvalores de una estructura
     x += deltsX  ó self.x += deltsX
     y += deltaY ó  self.y += deltaY
     
     mutatung -> tienen derecho para acceder a las variables de la estructura o enumerado y poder
     modificarlas
     */
    mutating func moveBy(x deltsX: Double, y deltaY: Double) {
        // self.x += deltsX
        // self.y += deltaY
        // Otra forma
        self = Point(x: self.x + deltsX, y: self.y + deltaY)
    }
}

var somePoint = Point(x: 4, y: 5)
somePoint.isToTheRight(of: 1) //true
somePoint.isToTheRight(of: 54) //false

// somePoint.x = 9 -> Error (cambiar somePoint de let a var9

somePoint.moveBy(x: 2, y: -3)

somePoint.x = 9


enum DifferentStateSwitch {
    case off, low, high
    
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}


var controllerStatus = DifferentStateSwitch.off
controllerStatus.next()
controllerStatus.next()
controllerStatus.next()



class SomeClass {
    class func someMethod(){
        print("Hello")
    }
}

SomeClass.someMethod()




struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    // dentro de Struct no se puede usar la clase
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    mutating func advanced(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advanced(to: level + 1)
    }
    
    init(name: String) {
        self.playerName = name
    }
}


var player = Player(name: "Lucas")

player.complete(level: 1) // cambiar hasta el nivel 7

player

if player.tracker.advanced(to: 7) {
    print("Se puede avanzar hasta el nivel 7")
} else {
    print("El nivel 7 sigue bloqueado por ahora")
}
