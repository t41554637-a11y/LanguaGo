import Foundation

struct LessonContent {
    static let lessons: [Lesson] = [
        Lesson(language: .german, title: "Приветствия", phrase: "Guten Morgen!", translation: "Доброе утро!", example: "Guten Morgen, wie geht es dir?"),
        Lesson(language: .german, title: "Знакомство", phrase: "Ich heiße Anna.", translation: "Меня зовут Анна.", example: "Ich heiße Anna. Und du?"),
        Lesson(language: .english, title: "Greetings", phrase: "Good morning!", translation: "Доброе утро!", example: "Good morning! How are you?"),
        Lesson(language: .english, title: "Introduction", phrase: "My name is Anna.", translation: "Меня зовут Анна.", example: "My name is Anna. What is your name?"),
        Lesson(language: .spanish, title: "Saludos", phrase: "¡Buenos días!", translation: "Доброе утро!", example: "¡Buenos días! ¿Cómo estás?"),
        Lesson(language: .spanish, title: "Presentación", phrase: "Me llamo Anna.", translation: "Меня зовут Анна.", example: "Me llamo Anna. ¿Y tú?"),
        Lesson(language: .chinese, title: "问候", phrase: "早上好！", translation: "Доброе утро!", example: "早上好！你好吗？")
    ]

    static func lessons(for language: Language) -> [Lesson] {
        lessons.filter { $0.language == language }
    }
}
