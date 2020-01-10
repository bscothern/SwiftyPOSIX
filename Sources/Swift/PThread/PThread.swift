//
//  PThread.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/9/18.
//  Copyright © 2018-2020 Braden Scothern. All rights reserved.
//

public final class PThread<T> {
    // MARK: - Types
    public typealias Function = () -> T

    // MARK: - Properties
    // MARK: Public Static
    @inlinable public static var destructorIterations: Int { Int(PTHREAD_DESTRUCTOR_ITERATIONS) }

    // MARK: Internal
    // Used to give consistant access into `pointer`
    @usableFromInline internal var pthread: pthread_t? { pointer.pointee }

    
    #if os(Linux)
    @usableFromInline internal var pointer = UnsafeMutablePointer<pthread_t>.allocate(capacity: 1)
    #else
    @usableFromInline internal var pointer = UnsafeMutablePointer<pthread_t?>.allocate(capacity: 1)
    #endif
    @usableFromInline internal var attribute: PThreadAttribute?
    @usableFromInline internal var function: Function!
    @usableFromInline internal var result: T?
    @usableFromInline internal lazy var context: UnsafeMutablePointer<PThreadContext> = {
        let value = UnsafeMutablePointer<PThreadContext>.allocate(capacity: 1)
        value.initialize(to: PThreadContext(runner: self))
        return value
    }()

    // MARK: - Init
    @inlinable
    init(attribute: PThreadAttribute? = nil) {
        self.attribute = PThreadAttribute(copy: attribute)
    }

    @inlinable
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
    @inlinable
    public func run(_ function: @escaping Function) {
        precondition(self.function == nil, "PThreads cannot execute multiple times.")
        self.function = function

        pthread_create(pointer, attribute?.pointer, { rawContext in
            #if os(Linux)
            let rawContext = rawContext!
            #endif
            let context = rawContext.bindMemory(to: PThreadContext.self, capacity: 1)
            context.pointee.runner?.execute()
            return nil
        }, self.context)
    }

    @inlinable
    public func cancel() {
        pthread_cancel(pthread!)
    }

    @inlinable
    public func detach() {
        pthread_detach(pthread!)
    }
}

// MARK: - Protocol Conformance
// MARK: Equatable
extension PThread: Equatable {
    @inlinable
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
    // MARK: Internal
    @usableFromInline
    func execute() {
        result = function()
    }
}

// MARK: - Types
// MARK: Private
@usableFromInline
internal struct PThreadContext {
    @usableFromInline weak var runner: PThreadRunnerProtocol?
}

@usableFromInline
internal protocol PThreadRunnerProtocol: AnyObject {
    func execute()
}
