import SwiftUI
import AVFoundation

struct LessonView: View {
    @ObservedObject var state: AppState
    let lesson: Lesson
    @Environment(\.dismiss) private var dismiss
    @State private var synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack(spacing: 24) {
            DinoView(message: "Повтори за мной!")

            Text(lesson.phrase)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)

            Text(lesson.translation)
                .font(.title3)
                .foregroundStyle(.secondary)

            Button {
                speak()
            } label: {
                Label("Прослушать", systemImage: "speaker.wave.3.fill")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue, in: RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.white)
            }

            Button {
                state.completeLesson()
                state.addWord(
                    VocabularyWord(
                        language: lesson.language,
                        original: lesson.phrase,
                        translation: lesson.translation,
                        example: lesson.phrase
                    )
                )
                dismiss()
            } label: {
                Label("Завершить урок", systemImage: "checkmark.circle.fill")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.green, in: RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .navigationTitle(lesson.title)
    }

    private func speak() {
        let utterance = AVSpeechUtterance(string: lesson.phrase)
        utterance.voice = AVSpeechSynthesisVoice(language: lesson.language.code)
        utterance.rate = 0.45
        synthesizer.speak(utterance)
    }
}
