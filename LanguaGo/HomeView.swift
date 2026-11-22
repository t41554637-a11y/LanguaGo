import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var store: ProgressStore
    @State private var selectedLesson: Lesson?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    DinoView(message: "Привет! Давай сохраним серию дня!")

                    streakCard
                    languagePicker
                    lessonList
                    HealthBreakView()
                }
                .padding()
            }
            .navigationTitle("LanguaGo")
            .navigationDestination(item: $selectedLesson) { lesson in
                LessonView(lesson: lesson)
            }
        }
    }

    private var streakCard: some View {
        VStack(spacing: 8) {
            Text("Серия дня")
                .font(.headline)
            Text("\(store.profile.streak) дней")
                .font(.system(size: 44, weight: .bold))
            Text("XP: \(store.profile.xp) · Слов: \(store.profile.words.count)")
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.green.opacity(0.15), in: RoundedRectangle(cornerRadius: 24))
    }

    private var languagePicker: some View {
        Picker("Язык", selection: $store.selectedLanguage) {
            ForEach(Language.allCases) { language in
                Text("\(language.flag) \(language.rawValue)").tag(language)
            }
        }
        .pickerStyle(.segmented)
    }

    private var lessonList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Уроки")
                .font(.headline)

            ForEach(LessonContent.lessons(for: store.selectedLanguage)) { lesson in
                Button {
                    selectedLesson = lesson
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(lesson.title)
                                .font(.headline)
                            Text(lesson.phrase)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 16))
                }
                .buttonStyle(.plain)
            }
        }
    }
}
