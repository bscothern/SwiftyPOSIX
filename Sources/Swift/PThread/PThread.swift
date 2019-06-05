//
//  PThread.swift
//  SwiftyPOSIX
//
//  Created by Braden Scothern on 2/9/18.
//  Copyright © 2018 Braden Scothern. All rights reserved.
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

public class PThread<T>: Equatable, PThreadRunnerProtocol {
    // MARK: - Types
    public typealias Function = () -> T

    // MARK: - Properties
    // MARK: Public Static
    public static var destructorIterations: Int {
        return Int(PTHREAD_DESTRUCTOR_ITERATIONS)
    }

    // Used to give consistant access into `pointer`
    internal var pthread: pthread_t? {
        return pointer.pointee
    }

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
            let context = UnsafeMutablePointer<PThreadContext>(OpaquePointer(rawContext))
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

    // MARK: FilePrivate
    fileprivate func execute() {
        result = function()
    }
}

// MARK: - Operators
// MARK: Public
public func == <T>(lhs: PThread<T>, rhs: PThread<T>) -> Bool {
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

// MARK: - Types
// MARK: Private
private struct PThreadContext {
    weak var runner: PThreadRunnerProtocol?
}

private protocol PThreadRunnerProtocol: AnyObject {
    func execute()
}
