import SwiftUI

struct ContentView: View {
    @StateObject private var state = AppState()

    var body: some View {
        TabView {
            HomeView(state: state)
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }

            DictionaryView(state: state)
                .tabItem {
                    Label("Словарь", systemImage: "book.fill")
                }
        }
    }
}
