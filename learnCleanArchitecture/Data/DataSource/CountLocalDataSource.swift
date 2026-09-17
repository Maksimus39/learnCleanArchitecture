//
//  CountLocalDataSource.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 15.09.2026.
//

import Foundation


protocol CountLocalDataSource {
    func load() -> Count
    func save(_ count: Count)
}

final class UserDefaultsCountLocalDataSource: CountLocalDataSource {
    private let key = "count_value"
    
    func load() -> Count {
        let value = UserDefaults.standard.integer(forKey: key)
        return Count(value: value)
    }
    
    func save(_ count: Count) {
        UserDefaults.standard.set(count.value, forKey: key)
    }
}
