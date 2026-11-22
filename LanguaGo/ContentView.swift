import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: ProgressStore

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }

            DictionaryView()
                .tabItem {
                    Label("Словарь", systemImage: "book.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person.fill")
                }
        }
    }
}
