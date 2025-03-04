//
//  ConsecutiveNonRepeatingState.swift
//  SevenAppsCase
//
//  Created by Talip on 4.03.2025.
//

import Combine

final class ConsecutiveNonRepeatingState<T: Equatable>: ObservableObject {
    @Published private(set) var value: T

    init(initialValue: T) {
        self.value = initialValue
    }

    func update(_ newValue: T) {
        guard value != newValue else { return }
        value = newValue
    }
}
