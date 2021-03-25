
/// Abstract Factory
///  It provides a way to encapsulate a group of individual factories that have a common theme
///  without specifying their concrete classes.
///  In normal usage, the client software creates a concrete implementation of the abstract factory and
///  then uses the generic interface of the factory to create the concrete objects that are part of the theme.
///  The client does not know (or care) which concrete objects it gets from each of these internal factories,
///  since it uses only the generic interfaces of their products.
///  This pattern separates the details of implementation of a set of objects from their general usage and
///  relies on object composition, as object creation is implemented in methods exposed in the factory interface.
///
///  The Abstract Factory design pattern solves problems like: 
///  - How can an application be independent of how its objects are created?
///  - How can a class be independent of how the objects it requires are created?
///  - How can families of related or dependent objects be created?
///
///  The Abstract Factory design pattern describes how to solve such problems:
///  - Encapsulate object creation in a separate (factory) object. That is, define an interface
///  (AbstractFactory) for creating objects, and implement the interface.
///  - A class delegates object creation to a factory object instead of creating objects directly.

protocol Shape {
    func draw()
}

struct Rect: Shape {
    func draw() { print("rect") }
}

struct RoundedRect: Shape {
    func draw() { print("rounded rect") }
}

enum FactoryType {
    case Shape
    case RoundedShape
}

protocol AbstractFactory {
    func getShape(of name: String) -> Shape
}

struct ShapeFactory: AbstractFactory {
    func getShape(of name: String) -> Shape {
        switch name {
        case "RECT":
            return Rect()
        default:
            return Rect()
        }
    }
}

struct RoundedShapeFactory: AbstractFactory {
    func getShape(of name: String) -> Shape {
        switch name {
        case "RECT":
            return RoundedRect()
        default:
            return RoundedRect()
        }
    }
}

class FactoryProducer {
    static func getFactory(of type: FactoryType) -> AbstractFactory {
        switch type {
        case .Shape:
            return ShapeFactory()
        case .RoundedShape:
            return RoundedShapeFactory()
        default:
            return ShapeFactory()
        }
    }
}

FactoryProducer.getFactory(of: .Shape).getShape(of: "RECT").draw()
FactoryProducer.getFactory(of: .RoundedShape).getShape(of: "RECT").draw()
