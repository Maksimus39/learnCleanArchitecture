//
//  CountAssembly.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 15.09.2026.
//




final class CountAssembly {
    static func assembly() -> CountViewModel {
        let localDataSource = UserDefaultsCountLocalDataSource()
        let repository = CountRepositoryImpl(localDataSource: localDataSource)
        
        let loadUseCase = LoadCountUseCaseImpl(repository: repository)
        let incrementUseCase = IncrementCountUseCaseImpl(repository: repository)
        let decrementUseCase = DecrementCountUseCaseImpl(repository: repository)
        
        return CountViewModel(
            loadUseCase: loadUseCase,
            incrementUseCase: incrementUseCase,
            decrementUseCase: decrementUseCase
        )
    }
}
