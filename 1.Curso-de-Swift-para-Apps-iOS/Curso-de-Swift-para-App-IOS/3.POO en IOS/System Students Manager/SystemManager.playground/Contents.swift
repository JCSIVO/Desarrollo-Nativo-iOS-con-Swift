let math = Subject(name: "Matematicas", teacherName: "Mrs. Sophie", level: SubjectLevel.intermediate)
let fisica = Subject(name: "Fisica", teacherName: "Mr. Donald", level: .advanced)
let biology = Subject(name: "Biologia", teacherName: "Mr. Parker", level: .intermediate)
let economy = Subject(name: "Economia", teacherName: "Mr. Carol", level: .intermediate)
// let desc = math.subjectDescription()
// print(desc)

let s1 = Student(name: "Blanca", age: 21, email: "blanca@g.com", subjects: [], scores: [])
let s2 = AdvancedStudent(name: "Lucas", age: 24, email: "lc@g.com", subjects: [], scores: [], extraPoints: 13)

let service = StudentsManager(students: [], maxStudents: 3)
do {
    //try service.insertStudent(nil)
    try service.insertStudent(s1)
    //try service.insertStudent(s1)
    try service.insertStudent(s2)
    //try service.insertStudent(s2)
    //try service.insertStudent(s2)

    try service.asignSubjectToStudent(subject: math, score: 90, student: s1)
    try service.asignSubjectToStudent(subject: fisica, score: 40, student: s1)
    try service.asignSubjectToStudent(subject: biology, score: 60, student: s1)

    //try service.asignSubjectToStudent(subject: economy, score: 90, student: s2)
    //try service.asignSubjectToStudent(subject: biology, score: 60, student: s2)
    //try service.asignSubjectToStudent(subject: math, score: 60, student: s2)

    try service.generateStudentsReport()
} catch {
    print(error.localizedDescription)
}


let average = service.getAverages()
let subjects = service.getCoursedSubjects()

// Sustituimos studentDescription por Describe para el protocol
// let descS1 = s1.describe()
// let descS2 = s2.describe()

// print(descS1)
// print(descS2)
