extension String {
    static var randValue: String {
        elementRandoms.randomElement() ?? "Sam"
    }
}

private let elementRandoms: [String] = [
    "Sam",
    "Lucas",
    "Emma",
    "Olivia",
    "Liam",
    "Noah",
    "Ava",
    "Mia",
    "Ethan",
    "Zoe"
]
