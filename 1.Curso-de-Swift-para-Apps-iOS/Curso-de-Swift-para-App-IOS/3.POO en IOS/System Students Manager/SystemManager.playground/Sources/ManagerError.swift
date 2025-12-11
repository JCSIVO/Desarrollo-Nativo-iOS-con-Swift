import Foundation

public enum ManageError: Error, LocalizedError {
    case studentNotAddedError
    case subjectNotAssignedError
    case reportNotFoundError
    case maxStudentsReachedError(max: Int)
    
    public var errorDescription: String? {
        switch self {
        case.studentNotAddedError:
            return "El estudiante no se pudo agregar"
        case.subjectNotAssignedError:
            return "No se pudo asignar la materia"
        case.reportNotFoundError:
            return "El reporte no se pudo encontrar"
        case.maxStudentsReachedError(let max):
            return "La cantidad máxima de estudiantes es: \(max) y ya fue alcanzada"
        }
    }
}
