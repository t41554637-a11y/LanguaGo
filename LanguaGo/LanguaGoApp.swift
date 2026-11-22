import SwiftUI

@main
struct LanguaGoApp: App {
    @StateObject private var store = ProgressStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
