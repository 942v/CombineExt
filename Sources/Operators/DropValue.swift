//
//  DropValue.swift
//  CombineExt
//
//  Created by Guillermo Sáenz on 11/6/24.
//

#if canImport(Combine)
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Publisher where Output == Bool {
    /// Toggles boolean values emitted by a publisher.
    ///
    /// - returns: A toggled value.
    func dropValue() -> Publishers.Map<Self, Void> {
        map { _ in }
    }
}
#endif
