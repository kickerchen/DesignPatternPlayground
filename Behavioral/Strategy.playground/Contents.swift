
/// Strategy
///  It enables selecting an algorithm at runtime. Instead of implementing a single algorithm directly,
///  code receives run-time instructions as to which in a family of algorithms to use.
///
///  For instance, a class that performs validation on incoming data may use the strategy pattern
///  to select a validation algorithm depending on the type of data, the source of the data,
///  user choice, or other discriminating factors.
///  These factors are not known until run-time and may require radically different validation to be performed.
///  The validation algorithms (strategies), encapsulated separately from the validating object, may be
///  used by other validating objects in different areas of the system (or even different systems)
///  without code duplication.

protocol Strategy {
    func doSort<T: Comparable>(array: [T]) -> [T]
}

struct StrategyAscent: Strategy {
    func doSort<T: Comparable>(array: [T]) -> [T] {
        return array.sorted()
    }
}

struct StrategyDescent: Strategy {
    func doSort<T: Comparable>(array: [T]) -> [T] {
        return array.sorted(by: >)
    }
}

class Context {
    private var strategy: Strategy

    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func change(strategy: Strategy) {
        self.strategy = strategy
    }

    func executeSortStrategy() {
        print(strategy.doSort(array: [4,2,7,1,9,3]))
    }
}

let cxt = Context(strategy: StrategyAscent())
cxt.executeSortStrategy()

cxt.change(strategy: StrategyDescent())
cxt.executeSortStrategy()
