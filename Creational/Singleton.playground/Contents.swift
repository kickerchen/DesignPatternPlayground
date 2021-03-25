
/// Singleton
///  It restricts the instantiation of a class to one "single" instance.
///  This is useful when exactly one object is needed to coordinate actions across the system.
///  The term comes from the mathematical concept of a singleton.
///
///  Critics consider the singleton to be an anti-pattern in that it is frequently used in scenarios where
///  it is not beneficial, introduces unnecessary restrictions in situations where a sole instance of
///  a class is not actually required, and introduces global state into an application.
///
///  The singleton design pattern solves problems like:
///  - How can it be ensured that a class has only one instance?
///  - How can the sole instance of a class be accessed easily?
///  - How can a class control its instantiation?
///  - How can the number of instances of a class be restricted?
///  - How can a global variable be accessed?
///
///  The singleton design pattern describes how to solve such problems:
///  - Hide the constructor of the class.
///  - Define a public static operation (getInstance()) that returns the sole instance of the class.

class Singleton {
    static let shared = Singleton()
    private(set) var status = "initialized"
    func set(status: String) {
        self.status = status
    }
}

let instance1 = Singleton.shared
let instance2 = Singleton.shared

print(instance2.status)
instance1.set(status: "instance1 set")
print(instance2.status)
