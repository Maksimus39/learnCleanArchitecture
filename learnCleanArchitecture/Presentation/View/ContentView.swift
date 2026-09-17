//
//  CountView.swift
//  learnCleanArchitecture
//
//  Created by Максим Минаков on 14.09.2026.
//

import SwiftUI


struct CountView: View {
    @EnvironmentObject var viewModel: CountViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.10, green: 0.11, blue: 0.20),
                    Color(red: 0.20, green: 0.10, blue: 0.35)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 48) {
                Text("Счётчик")
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.6))
                    .tracking(2)
                    .textCase(.uppercase)
                
                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.purple.opacity(0.5),
                                    Color.purple.opacity(0.0)
                                ],
                                center: .center,
                                startRadius: 20,
                                endRadius: 140
                            )
                        )
                        .frame(width: 280, height: 280)
                        .blur(radius: 20)
                    
                    Circle()
                        .fill(.ultraThinMaterial)
                        .overlay(
                            Circle()
                                .stroke(
                                    LinearGradient(
                                        colors: [
                                            .white.opacity(0.5),
                                            .white.opacity(0.05)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1.5
                                )
                        )
                        .frame(width: 240, height: 240)
                        .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
                    
                    Text("\(viewModel.count.value)")
                        .font(.system(size: 96, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .contentTransition(.numericText())
                        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: viewModel.count.value)
                        .monospacedDigit()
                }
                
                HStack(spacing: 32) {
                    CircleButton(
                        icon: "minus",
                        color: .pink
                    ) {
                        viewModel.decrement()
                    }
                    
                    CircleButton(
                        icon: "plus",
                        color: .green
                    ) {
                        viewModel.increment()
                    }
                }
            }
            .padding()
        }
    }
}





#Preview {
    CountView()
        .environmentObject(CountAssembly.assembly())
}
