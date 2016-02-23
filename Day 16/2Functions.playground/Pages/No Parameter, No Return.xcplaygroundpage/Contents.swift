//: ### No Parameter, No Return
//: [TOC](TOC) | Previous | [Next](@next)


func hello(name: String = "World", numberOfTimes: Int = 1) {
    for _ in 1 ... numberOfTimes {
        print("Hello, \(name)!")
    }
}
func hello(name: String, _ affiliation: String) {
    print("Hello \(name) from \(affiliation)")
}
hello("Swift Programmer", "Dim Sum Thinking")
hello()
hello("Swift Programmer")
hello("Swift 2 Adopter", numberOfTimes: 3)
hello(numberOfTimes: 2)
func hello(peopleNamed people: String...) {
    if people.isEmpty {
        hello(peopleNamed: "World")
    }
    for person in people {
        print("Hello, \(person)!")
    }
}//: [TOC](TOC) | Previous | [Next](@next)
