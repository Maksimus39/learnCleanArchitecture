import SwiftUI



@main
struct learnCleanArchitectureApp: App {
    @StateObject private var viewModel = CountAssembly.assembly()   
    
    var body: some Scene {
        WindowGroup {
            CountView()
                .environmentObject(viewModel)
        }
    }
}
