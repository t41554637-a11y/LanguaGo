import Foundation

enum Language: String, CaseIterable, Identifiable {
    case german = "Немецкий"
    case english = "Английский"
    case spanish = "Испанский"
    case chinese = "Китайский"

    var id: String { rawValue }

    var code: String {
        switch self {
        case .german: return "de"
        case .english: return "en"
        case .spanish: return "es"
        case .chinese: return "zh"
        }
    }
}

struct VocabularyWord: Identifiable, Codable {
    var id = UUID()
    var language: Language
    var original: String
    var translation: String
    var example: String
    var isLearned = false
}

struct Lesson: Identifiable {
    var id = UUID()
    var language: Language
    var title: String
    var phrase: String
    var translation: String
}

final class AppState: ObservableObject {
    @Published var selectedLanguage: Language = .german
    @Published var streak = 0
    @Published var xp = 0
    @Published var words: [VocabularyWord] = []

    func completeLesson() {
        streak += 1
        xp += 20
    }

    func addWord(_ word: VocabularyWord) {
        words.append(word)
    }
}
