//
//  PThread.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/9/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

public class PThread<T> {
    // MARK: - Types
    public typealias Function = () -> T

    // MARK: - Properties
    // MARK: Public Static
    public static var destructorIterations: Int { Int(PTHREAD_DESTRUCTOR_ITERATIONS) }

    // Used to give consistant access into `pointer`
    @usableFromInline
    internal var pthread: pthread_t? { pointer.pointee }

    #if os(Linux)
    private var pointer = UnsafeMutablePointer<pthread_t>.allocate(capacity: 1)
    #else
    private var pointer = UnsafeMutablePointer<pthread_t?>.allocate(capacity: 1)
    #endif
    private var attribute: PThreadAttribute?
    private var function: Function!
    private var result: T?
    private lazy var context: UnsafeMutablePointer<PThreadContext> = {
        let value = UnsafeMutablePointer<PThreadContext>.allocate(capacity: 1)
        value.initialize(to: PThreadContext(runner: self))
        return value
    }()

    // MARK: - Init
    init(attribute: PThreadAttribute? = nil) {
        self.attribute = PThreadAttribute(copy: attribute)
    }

    convenience init(attribute: PThreadAttribute? = nil, _ function: @escaping Function) {
        self.init(attribute: attribute)
        self.run(function)
    }

    deinit {
        pointer.deallocate()
        context.deallocate()
    }

    // MARK: - Funcs
    // MARK: - Public Static
    public static func exit(value: Any) {
    }

    // MARK: - Public
    public func run(_ function: @escaping Function) {
        precondition(self.function == nil, "PThreads cannot execute multiple times.")
        self.function = function

        pthread_create(pointer, attribute?.pointer, { rawContext in
            #if os(Linux)
            let rawContext = rawContext!
            #endif
            let context = UnsafeMutablePointer<PThreadContext>(.init(rawContext))
            context.pointee.runner?.execute()
            return nil
        }, self.context)
    }

    public func cancel() {
        pthread_cancel(pthread!)
    }

    public func detach() {
        pthread_detach(pthread!)
    }
}

// MARK: - Protocol Conformance
// MARK: Equatable
extension PThread: Equatable {
    public static func == <T>(lhs: PThread<T>, rhs: PThread<T>) -> Bool {
        if lhs === rhs {
            return true
        }
        guard let lhs = lhs.pthread,
            let rhs = rhs.pthread
            else {
                return false
        }
        return pthread_equal(lhs, rhs) != 0
    }
}

// MARK: PThreadRunnerProtocol
extension PThread: PThreadRunnerProtocol{
    // MARK: FilePrivate
    fileprivate func execute() {
        result = function()
    }
}

// MARK: - Types
// MARK: Private
private struct PThreadContext {
    weak var runner: PThreadRunnerProtocol?
}

private protocol PThreadRunnerProtocol: AnyObject {
    func execute()
}
