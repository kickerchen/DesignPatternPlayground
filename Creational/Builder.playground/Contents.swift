
/// Builder
///  It provides a flexible solution to various object creation problems in object-oriented programming.
///  The intent of the Builder design pattern is to separate the construction of a complex object from
///  its representation. By doing so, the same construction process can create different representations.
///
///  The Builder design pattern solves problems like:
///  - How can a class (the same construction process) create different representations of a complex object?
///  - How can a class that includes creating a complex object be simplified?
///
///  The Builder design pattern describes how to solve such problems:
///  - Encapsulate creating and assembling the parts of a complex object in a separate Builder object.
///  - A class delegates object creation to a Builder object instead of creating the objects directly.

protocol HouseBuilder {
    func buildDoor()
    func buildWindow()
    func buildWall()
}

struct ConcreteBuilder1: HouseBuilder {
    func buildDoor() { print("build door 1") }
    func buildWall() { print("build wall 1") }
    func buildWindow() { print("build window 1") }
}

struct ConcreteBuilder2: HouseBuilder {
    func buildDoor() { print("build door 2") }
    func buildWall() { print("build wall 2") }
    func buildWindow() { print("build window 2") }
}

class HouseManager {
    private var builder: HouseBuilder?
    func set(builder: HouseBuilder) { self.builder = builder }
    func buildHouseTypeA() {
        builder?.buildDoor()
        builder?.buildWall()
        builder?.buildWall()
        builder?.buildWall()
    }
    func buildHouseTypeB() {
        builder?.buildWall()
        builder?.buildWindow()
        builder?.buildDoor()
    }
}

let manager = HouseManager()
manager.set(builder: ConcreteBuilder1())
manager.buildHouseTypeA()
manager.buildHouseTypeB()
