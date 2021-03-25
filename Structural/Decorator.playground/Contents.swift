
/// Decorator
///  It allows behavior to be added to an individual object, dynamically, without affecting the behavior
///  of other objects from the same class.
///  The decorator pattern is often useful for adhering to the Single Responsibility Principle, as it allows
///  functionality to be divided between classes with unique areas of concern.
///  Decorator use can be more efficient than subclassing, because an object's behavior can be
///  augmented without defining an entirely new object

protocol Shape {
    func draw()
}

class Circle: Shape {
    func draw() {
        print("Shape: circle")
    }
}

class ShapeDecorator: Shape {
    private var decoratedShape: Shape
    init(shape: Shape) {
        self.decoratedShape = shape
    }
    func draw() {
        decoratedShape.draw()
    }
}

class RedShapeDecorator: ShapeDecorator {
    override func draw() {
        super.draw()
        print("And it's Red")
    }
}

let circle = Circle()
circle.draw()

let redCircle = RedShapeDecorator(shape: circle)
redCircle.draw()
