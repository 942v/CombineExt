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
    /// Toggles boolean values emitted by a publisher.
    ///
    /// - returns: A toggled value.
    func filterNil() -> Publishers.Filter<Self> {
        filter {
            $0.value != nil
        }
    }
}
#endif
