//
//  LoadCountUseCaseImpl.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 15.09.2026.
//
import Foundation
 

import Foundation

protocol LoadCountUseCase {
    func execute() async throws -> Count
}

final class LoadCountUseCaseImpl: LoadCountUseCase {
    private let repository: CountRepository
    
    init(repository: CountRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> Count {
        return try await repository.load()
    }
}
