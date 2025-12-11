import Foundation

public class AdvancedStudent: Student {
    let extraPoints: Double
    
    public init(name: String, age: Int, email: String, subjects: [Subject], scores: [Double], extraPoints: Double) {
        self.extraPoints = extraPoints
        super.init(name: name, age: age, email: email, subjects: subjects, scores: scores)
    }
    // Sustituimos studentDescription por Describe para el protocol
    public override func describe() -> String {
        var desc =  """
            ----------------
            ESTUDIANTE AVANZADO:
            ----------------
            Nombre: \(name)
            Edad: \(age)
            Punto Extras: \(extraPoints)
            Correo electrónico: \(email)
            Materias que cursa: \(subjects)
            """
        
        for subject in subjects {
            desc += "\(subject.describe())"
        }
        
        desc += """
        \n----------------
        """
        return desc
    }
}

