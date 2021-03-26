
/// Command
///  An object is used to encapsulate all information needed to perform an action or trigger an event
///  at a later time. This information includes the method name, the object that owns the method
///  and values for the method parameters.
///
///  Four terms always associated with the command pattern are command, receiver, invoker and client.
///
///  A command object knows about receiver and invokes a method of the receiver.
///  Values for parameters of the receiver method are stored in the command.
///
///  The receiver object to execute these methods is also stored in the command object by aggregation.
///  The receiver then does the work when the execute() method in command is called.
///
///  An invoker object knows how to execute a command, and optionally does bookkeeping about
///  the command execution.
///  The invoker does not know anything about a concrete command, it knows only about
///  the command interface.
///
///  Invoker object(s), command objects and receiver objects are held by a client object, the client
///  decides which receiver objects it assigns to the command objects, and which commands it
///  assigns to the invoker.
///
///  The client decides which commands to execute at which points.
///  To execute a command, it passes the command object to the invoker object.

protocol Command {
    func execute()
}

class Receiver {
    func doWork1() {
        print("Work 1 is executed")
    }
    func doWork2() {
        print("Work 2 is executed")
    }
}

class CommandA: Command {
    private var receiver: Receiver

    init(with receiver: Receiver) {
        self.receiver = receiver
    }

    func execute() {
        receiver.doWork1()
    }
}

class CommandB: Command {
    private var receiver: Receiver

    init(with receiver: Receiver) {
        self.receiver = receiver
    }

    func execute() {
        receiver.doWork2()
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

class Client {
    func test() {
        let invoker = Invoker()
        let receiver = Receiver()
        invoker.add(command: CommandA(with: receiver))
        invoker.add(command: CommandA(with: receiver))
        invoker.add(command: CommandB(with: receiver))
        invoker.add(command: CommandA(with: receiver))
        invoker.run()
    }    
}

Client().test()
