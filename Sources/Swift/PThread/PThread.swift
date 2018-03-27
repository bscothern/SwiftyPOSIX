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

import Foundation

public class PThread: Equatable {
    //MARK:- Types
    public typealias Function = () -> Any

    //MARK:- Properties
    internal var pointer = UnsafeMutablePointer<pthread_t?>.allocate(capacity: 1)
    private var attribute: PThreadAttribute?
    private var function: Function?
    private var result: Any?

    //MARK:- Init
    init(attribute: PThreadAttribute? = nil) {
        self.attribute = PThreadAttribute(copy: attribute)
    }

    convenience init(attribute: PThreadAttribute? = nil, _ function: @escaping Function) {
        self.init(attribute: attribute)
        self.run(function)
    }

    deinit {
        pointer.deallocate(capacity: 1)
    }

    //MARK:- Funcs
    //MARK:- Public Static
    public static func exit(value: Any) {
    }

    //MARK:- Public
    public func run(_ function: @escaping Function) {
        precondition(self.function == nil, "PThreads cannot execute multiple times.")
        self.function = function

        pthread_create(pointer, attribute?.pointer, { context in
            let pthread = Unmanaged<PThread>.fromOpaque(context).takeUnretainedValue()
            let result = pthread.function!()

            return nil
        }, Unmanaged<PThread>.passUnretained(self).toOpaque())
    }

    public func cancel() {
        pthread_cancel(pointer.pointee!)
    }

    public func detach() {
        pthread_detach(pointer.pointee!)
    }
}

public func == (lhs: PThread, rhs: PThread) -> Bool {
    if lhs === rhs {
        return true
    }
    guard let lhs = lhs.pointer.pointee,
        let rhs = rhs.pointer.pointee
        else {
            return false
    }
    return pthread_equal(lhs, rhs) != 0
}
