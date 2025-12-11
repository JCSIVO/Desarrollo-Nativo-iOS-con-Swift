import Foundation


public struct Subject: Describable, Hashable {
    let name: String
    let teacherName: String
    //let minumumScore: Double
    let level: SubjectLevel
    
    public init(name: String, teacherName: String, level: SubjectLevel) {
        self.name = name
        self.teacherName = teacherName
        self.level = level
    }
    
    public func isPassed(score: Double) -> Bool {
        return score >= minimumScore()
    }
    // Sustituimos studentDescription por Describe para el protocol -> Describable
    public func describe()-> String {
        return """
        ----------------------------
        Materia: \(name)
        Profesor: \(teacherName)
        Puntaje minimo para pasar: \(minimumScore())
        """
    }
    
    private func minimumScore() -> Double {
        switch level {
        case .basic:
            return 50.0
        case .intermediate:
            return 70.0
        case .advanced:
            return 80.0
        }
    }
}

