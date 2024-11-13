//
//  DropValue.swift
//  CombineExt
//
//  Created by Guillermo Sáenz on 11/6/24.
//

#if canImport(Combine)
import Combine

public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    public var value: Wrapped? {
        return self
    }
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Publisher where Output: OptionalType {
    /**
     Unwraps and filters out `nil` elements.

     - returns: `AnyPublisher` of source `AnyPublisher`'s elements, with `nil` elements filtered out.
     */

    func filterNil() -> AnyPublisher<Output.Wrapped, Failure> {
        return flatMap { element -> AnyPublisher<Output.Wrapped, Failure> in
            guard let value = element.value else {
                return Empty().eraseToAnyPublisher()
            }
            return .create { subscriber in
                subscriber.send(value)
                subscriber.send(completion: .finished)
                return AnyCancellable {}
            }.eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
#endif
