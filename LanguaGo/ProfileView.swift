import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var store: ProgressStore

    var body: some View {
        NavigationStack {
            List {
                Section("Прогресс") {
                    LabeledContent("Серия", value: "\(store.profile.streak) дней")
                    LabeledContent("XP", value: "\(store.profile.xp)")
                    LabeledContent("Слов в словаре", value: "\(store.profile.words.count)")
                    LabeledContent("Здоровых перерывов", value: "\(store.profile.healthBreaksCompleted)")
                }

                Section("О LanguaGo") {
                    LabeledContent("Версия", value: "1.0")
                    LabeledContent("Персонаж", value: "Дино-завр")
                }
            }
            .navigationTitle("Профиль")
        }
    }
}
