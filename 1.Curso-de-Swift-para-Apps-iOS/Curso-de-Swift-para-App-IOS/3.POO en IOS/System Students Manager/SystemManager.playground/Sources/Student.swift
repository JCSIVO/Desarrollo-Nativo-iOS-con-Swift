import Foundation

public class Student: Describable {
    let name: String
    let age: Int
    let email: String
    var subjects: [Subject]
    var scores: [Double]
    
    public init(name: String, age: Int, email: String, subjects: [Subject], scores: [Double]) {
        self.name = name
        self.age = age
        self.email = email
        self.subjects = subjects
        self.scores = scores
    }
    // Sustituimos studentDescription por Describe para el protocol
    public func describe() -> String {
        var desc =  """
            ----------------
            ESTUDIANTE:
            ----------------
            Nombre: \(name)
            Edad: \(age)
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
    
    public func assignSubject(subject: Subject, score: Double) {
        self.subjects.append(subject)
        self.scores.append(score)
    }
    
    // Debe tener por lo menos el 60 % de las materias pasadas
    public func isApproved() -> Bool {
        var approvedSubjectsCount = 0
        for i in 0..<subjects.count {
            let subject = subjects[i]
            let score = scores[i]
            
            if subject.isPassed(score: score) {
                approvedSubjectsCount += 1
            }
        }
        let percentage = (Double(approvedSubjectsCount) / Double(subjects.count)) * 100
        return percentage > 60
    }
    
    public func getAverageScore() -> Double {
        var sum: Double = 0
        for score in scores {
            sum += score
        }
        return sum / Double(scores.count)
    }
}

