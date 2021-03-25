
/// Facade
///  Analogous to a facade in architecture, a facade is an object that serves as
///  a front-facing interface masking more complex underlying or structural code.
///  A facade can:
///  - improve the readability and usability of a software library by masking interaction with
///  more complex components behind a single (and often simplified) API
///  - provide a context-specific interface to more generic functionality (complete with
///  context-specific input validation)
///  - serve as a launching point for a broader refactor of monolithic or
///  tightly-coupled systems in favor of more loosely-coupled code

protocol Shape {
    func draw()
}

class Circle: Shape {
    func draw() {
        print("circle")
    }
}

class Rectangle: Shape {
    func draw() {
        print("rectangle")
    }
}

class Square: Shape {
    func draw() {
        print("square")
    }
}

class ShapeMaker {
    private var circle = Circle()
    private var rect = Rectangle()
    private var square = Square()

    func drawCircle() {
        circle.draw()
    }
    func drawRectangle() {
        rect.draw()
    }
    func drawSquare() {
        square.draw()
    }
}

let facade = ShapeMaker()
facade.drawCircle()
facade.drawSquare()
facade.drawRectangle()
