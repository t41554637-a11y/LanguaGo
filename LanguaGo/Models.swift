import Foundation

enum Language: String, CaseIterable, Codable, Identifiable {
    case german = "Немецкий"
    case english = "Английский"
    case spanish = "Испанский"
    case chinese = "Китайский"

    var id: String { rawValue }

    var code: String {
        switch self {
        case .german: return "de-DE"
        case .english: return "en-US"
        case .spanish: return "es-ES"
        case .chinese: return "zh-CN"
        }
    }

    var flag: String {
        switch self {
        case .german: return "🇩🇪"
        case .english: return "🇬🇧"
        case .spanish: return "🇪🇸"
        case .chinese: return "🇨🇳"
        }
    }
}

struct VocabularyWord: Identifiable, Codable, Hashable {
    var id = UUID()
    var language: Language
    var original: String
    var translation: String
    var example: String
    var reviewCount = 0
    var isLearned = false
}

struct Lesson: Identifiable, Codable, Hashable {
    var id = UUID()
    var language: Language
    var title: String
    var phrase: String
    var translation: String
    var example: String
}

struct UserProfile: Codable {
    var streak = 0
    var xp = 0
    var lastLessonDate: Date?
    var words: [VocabularyWord] = []
    var healthBreaksCompleted = 0
}
