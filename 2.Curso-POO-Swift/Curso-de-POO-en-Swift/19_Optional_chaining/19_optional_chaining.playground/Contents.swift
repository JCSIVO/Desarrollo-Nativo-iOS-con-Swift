import UIKit


/*class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

var lucas = Person() // nil


// let roomCount = lucas.residence!.numberOfRooms // Error -> No tiene residencia

if let roomCount = lucas.residence?.numberOfRooms {
    print("La casa de lucas tiene \(roomCount) habitación(es)")
} else {
    print("Lucas no tiene casa")
}

lucas.residence = Residence()


if let roomCount = lucas.residence?.numberOfRooms {
    print("La casa de lucas tiene \(roomCount) habitación(es)")
} else {
    print("Lucas no tiene casa")
}*/

class Person {
    var residence : Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    var address: Address?
    
    func printNumberOfRooms() {
        print("El número de habitaciones es \(numberOfRooms)")
    }
}

class Room {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber), \(street)"
        } else if buildingName != nil {
            return buildingName
        }else {
            return nil
        }
    }
}


let estrella = Person()

if let roomCount = estrella.residence?.numberOfRooms {
    print("La casa de Estrella tiene \(roomCount) habitación(es)")
} else {
    print("Estrella no tiene casa")
}


func createAddress() -> Address {
    print("La funciona ha sido llamada")
    
    let someAddress = Address()
    someAddress.buildingNumber = "19"
    someAddress.street = "Calle de Plaka"
    //estrella.residence?.address = someAddress // ! en vez de ? rompe el código
    return someAddress
}

//let someAddress = Address()
//someAddress.buildingNumber = "19"
//someAddress.street = "Calle de Plaka"
estrella.residence?.address = createAddress()  //someAddress // ! en vez de ? rompe el código
estrella


estrella.residence?.printNumberOfRooms()

if estrella.residence?.printNumberOfRooms() != nil {
    print("He podido obtener el numero de habitaciones")
} else {
    print("No ha sido posible saber el número de habitaciones")
}


if (estrella.residence?.address = createAddress()) != nil {
    print("Ha sido posible configurar la dirección de Estrella")
} else {
    print("Seguimos sin saber donde vive Estrella")
}


if let firstRoomName = estrella.residence?[0].name {
    print("La primera habitación es de \(firstRoomName)")
} else {
    print("La primera habitación no sabemos de quien es")
}


estrella.residence?[0] = Room(name: "Bathroom")


let estrellaHouse = Residence()
estrellaHouse.rooms.append(Room(name: "Bathroom"))
estrellaHouse.rooms.append(Room(name: "Living Room"))
estrellaHouse.rooms.append(Room(name: "Kitchen"))

estrella.residence = estrellaHouse


if let firstRoomName = estrella.residence?[0].name {
    print("La primera habitación es de \(firstRoomName)")
} else {
    print("La primera habitación no sabemos de quien es")
}

estrella.residence?.address  = createAddress()

if let estrellaStreet = estrella.residence?.address?.street {
    print("La casa de Estrella esta en  \(estrellaStreet)")
} else {
    print("No se donde vive Estrella")
}


if let buildingIdentier = estrella.residence?.address?.buildingIdentifier() {
    print("Estrella vive en \(buildingIdentier)")
}

// Sustituir _ por beginWith19
if let _ = estrella.residence?.address?.buildingIdentifier()?.hasPrefix("19") {
    print("Estrella vive en el numero 19")
} else {
    print("Estrella no vive en el numero 19")
}
