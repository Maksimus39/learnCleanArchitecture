//
//  CountRepozitory.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 15.09.2026.
//



import Foundation


protocol CountRepository {
    func load() async throws -> Count
    func save(_ count: Count) async throws
}
