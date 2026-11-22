import SwiftUI

struct HomeView: View {
    @ObservedObject var state: AppState
    @State private var currentLesson: Lesson?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    DinoView(message: "Привет! Давай сохраним серию дня!")

                    VStack(spacing: 8) {
                        Text("Серия дня")
                            .font(.headline)
                        Text("\(state.streak) дней")
                            .font(.largeTitle.bold())
                        Text("XP: \(state.xp)")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.green.opacity(0.15), in: RoundedRectangle(cornerRadius: 20))

                    Picker("Язык", selection: $state.selectedLanguage) {
                        ForEach(Language.allCases) { language in
                            Text(language.rawValue).tag(language)
                        }
                    }
                    .pickerStyle(.segmented)

                    Button {
                        currentLesson = Lesson(
                            language: state.selectedLanguage,
                            title: "Урок дня",
                            phrase: samplePhrase(for: state.selectedLanguage).0,
                            translation: samplePhrase(for: state.selectedLanguage).1
                        )
                    } label: {
                        Label("Начать урок", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.green, in: RoundedRectangle(cornerRadius: 16))
                            .foregroundStyle(.white)
                    }

                    HealthBreakView()
                }
                .padding()
            }
            .navigationTitle("LanguaGo")
            .navigationDestination(item: $currentLesson) { lesson in
                LessonView(state: state, lesson: lesson)
            }
        }
    }

    private func samplePhrase(for language: Language) -> (String, String) {
        switch language {
        case .german: return ("Guten Morgen!", "Доброе утро!")
        case .english: return ("Good morning!", "Доброе утро!")
        case .spanish: return ("¡Buenos días!", "Доброе утро!")
        case .chinese: return ("早上好！", "Доброе утро!")
        }
    }
}
