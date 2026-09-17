//
//  CountRepositoryImpl.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 15.09.2026.
//
import Foundation



final class CountRepositoryImpl: CountRepository {
    private let localDataSource: CountLocalDataSource
    
    init(localDataSource: CountLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func load() -> Count {
        return localDataSource.load()
    }
    
    func save(_ count: Count) {
        localDataSource.save(count)
    }
}
