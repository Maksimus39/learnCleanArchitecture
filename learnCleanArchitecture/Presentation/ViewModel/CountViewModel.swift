//
//  CountViewModel.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 15.09.2026.
//
import Foundation
import Combine



final class CountViewModel: ObservableObject {
    @Published private(set) var count: Count = Count(value: 0)
    @Published var errorMessage: String?
    
    private let loadUseCase: LoadCountUseCase
    private let incrementUseCase: IncrementCountUseCase
    private let decrementUseCase: DecrementCountUseCase
    
    init(loadUseCase: LoadCountUseCase,
         incrementUseCase: IncrementCountUseCase,
         decrementUseCase: DecrementCountUseCase) {
        self.loadUseCase = loadUseCase
        self.incrementUseCase = incrementUseCase
        self.decrementUseCase = decrementUseCase
        
        Task {
            await loadCount()
        }
    }
    
    func increment() {
        Task {
            do {
                let newCount = try await incrementUseCase.execute()
                await MainActor.run {
                    self.count = newCount
                }
            } catch {
                handleError(error)
            }
        }
    }
    
    func decrement() {
        Task {
            do {
                let newCount = try await decrementUseCase.execute()
                await MainActor.run {
                    self.count = newCount
                }
            } catch {
                handleError(error)
            }
        }
    }
    
    private func loadCount() async {
        do {
            let loadedCount = try await loadUseCase.execute()
            await MainActor.run {
                self.count = loadedCount
            }
        } catch {
            handleError(error)
        }
    }
    
    private func handleError(_ error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
