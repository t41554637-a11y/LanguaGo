import Foundation
import SwiftUI

final class ProgressStore: ObservableObject {
    private let key = "languago.profile"

    @Published var profile: UserProfile {
        didSet { save() }
    }

    @Published var selectedLanguage: Language = .german

    init() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode(UserProfile.self, from: data) {
            profile = decoded
        } else {
            profile = UserProfile()
        }
    }

    var words: [VocabularyWord] { profile.words }

    func completeLesson(_ lesson: Lesson) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        if let last = profile.lastLessonDate,
           calendar.isDate(calendar.startOfDay(for: last), inSameDayAs: today) == false {
            profile.streak += 1
        } else if profile.lastLessonDate == nil {
            profile.streak = 1
        }

        profile.lastLessonDate = Date()
        profile.xp += 20
        addWord(
            VocabularyWord(
                language: lesson.language,
                original: lesson.phrase,
                translation: lesson.translation,
                example: lesson.example
            )
        )
    }

    func addWord(_ word: VocabularyWord) {
        guard !profile.words.contains(word) else { return }
        profile.words.append(word)
    }

    func markLearned(_ word: VocabularyWord) {
        guard let index = profile.words.firstIndex(where: { $0.id == word.id }) else { return }
        profile.words[index].isLearned = true
        profile.words[index].reviewCount += 1
    }

    func completeHealthBreak() {
        profile.healthBreaksCompleted += 1
        profile.xp += 5
    }

    private func save() {
        if let data = try? JSONEncoder().encode(profile) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
