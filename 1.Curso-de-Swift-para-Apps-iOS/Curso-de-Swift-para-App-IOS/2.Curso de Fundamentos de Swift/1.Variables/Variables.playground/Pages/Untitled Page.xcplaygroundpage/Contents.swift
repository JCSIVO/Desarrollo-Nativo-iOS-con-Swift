// Declaracion de variables de forma implicita
let firstConstant = 10

var secondVariable = 20
secondVariable = 10


var myFirstString = "Hello, World!"


var firstDouble = 2.0

var myFirstBool = true // false

// Declaracion de variables de forma Explicita
var otherString: String = "Hello World 2!"
var otherInt: Int = 10
var otherDouble: Double = 2.0
var otherBool : Bool = true // false


// Operaciones con Variables

var n1 = 10
var n2 = 20

var sum = n1 + n2
var resta  = n1 - n2
var multiplicacion = n1 * n2
var division = n1 / n2


var n3: Double = 10
var n4: Double = 20

var division2 = n3 / n4


var s1 = "Hola"
var s2 = "Mundo"

var concatenacion = s1 +  " " + s2 //Se le añade el espacio en blanco para evitar HolaMundo


var b1 = true
var b2 = false

var or = b1 || b2 //Devuelve true "Una de las dos es verdadera"
var and = b1 && b2 //Ambas tienen que ser verdaderas para devolver true



let name = "Lucas"
let greetings = "Hola! \(name). Estas en el curso de Swift."
print(greetings)


// Tarea del Curso
// Mostrar por consola la siguiente frase:
// Numero de caracteres en el nombre: 5
// Tip: .count en Strings

let name2 = "Lucas"
let greetings2 = "Numero de caracteres en el nombre: \(name2) es \(name.count)"
print(greetings2)
