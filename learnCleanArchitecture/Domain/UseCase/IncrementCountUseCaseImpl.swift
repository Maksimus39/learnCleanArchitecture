//
//  CountUseCase.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 15.09.2026.
//
import Foundation


protocol IncrementCountUseCase {
    func execute() async throws -> Count
}

final class IncrementCountUseCaseImpl: IncrementCountUseCase {
    private let repository: CountRepository
    
    init(repository: CountRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> Count {
        let current = try await repository.load()
        let updated = Count(value: current.value + 1)
        try await repository.save(updated)
        return updated
    }
}
