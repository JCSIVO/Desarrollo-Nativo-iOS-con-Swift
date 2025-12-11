import UIKit


// Struct vs Class

struct  SomeStruct {
    // La definición de la estructura aquí
}

class SomeClass {
    // La definición de la clase aquí
}

// Contenedores de datos que no necesitan de hacer muchas cosas
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)

someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)

// someResolution.width = 1280 // Al ser declarada como constante "let" no se puede modificar

// Si lo cambia el valor
someVideoMode.frameRate = 30.0
print(someVideoMode.frameRate)


/*
 Las estructuras una vez creadas ocupan un espacio en la memoria y si de delcara constante debe
 permanecer inmutable -> copias, tienen su propio espacio de memoria
 
 Con las clases lo que obtienes es la zona de la memoria que ocupa y las variables declaradas dentro
 podran ir cambiando si se han declarado como var, si son let no se podrian cambiar ->
 referencias, apuntan a un espacio de memoria
 */


let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd
print("\(cinema.width) X \(cinema.height)")
cinema.width = 2048
print("\(cinema.width) X \(cinema.height)")

print("\(hd.width) X \(hd.height)") // No ha cambiado del width a 2048



enum CompassPoint {
    case north, south, east, west
}

var currentDirection = CompassPoint.north
let oldDirection = currentDirection
currentDirection = .south

print(currentDirection) // -> south
print(oldDirection) // .> north


/* Los valores van por copias (struct y enum), estructuras y enumerados tienen valores que
 se copian de un lado a otro
 
 Las clases no copian sus valores, ya que son tipos de datos referenciados, es decir, no es una copia
 sino que es una referencia y en caso de modificar cualquiera de ellas, estas si se veran afectadas
 */


let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0


let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty // Si ha cambiado el valor del frameRate en la copia

if tenEighty === alsoTenEighty { // Diferente -> !== (No igualdad)
    print("Son el mismo objeto")
} else {
    print("Son diferentes")
}
