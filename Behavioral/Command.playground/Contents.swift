
/// Command
///  An object is used to encapsulate all information needed to perform an action or trigger an event
///  at a later time. This information includes the method name, the object that owns the method
///  and values for the method parameters.

protocol Command {
    func execute()
}

class CommandA: Command {
    func execute() {
        print("Command A executes some operations")
    }
}

class CommandB: Command {
    func execute() {
        print("Command B executes some operations")
    }
}

class Invoker {
    private var commandQueue = [Command]()

    func add(command: Command) {
        commandQueue.append(command)
    }

    func run() {
        commandQueue.forEach {
            $0.execute()
        }
    }
}

let invoker = Invoker()
invoker.add(command: CommandA())
invoker.add(command: CommandA())
invoker.add(command: CommandB())
invoker.add(command: CommandA())
invoker.add(command: CommandA())
invoker.run()
