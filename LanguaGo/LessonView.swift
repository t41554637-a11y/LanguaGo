import SwiftUI
import AVFoundation

struct LessonView: View {
    let lesson: Lesson
    @EnvironmentObject private var store: ProgressStore
    @Environment(\.dismiss) private var dismiss
    @State private var synthesizer = AVSpeechSynthesizer()
    @State private var isCompleted = false

    var body: some View {
        VStack(spacing: 24) {
            DinoView(message: "Повтори за мной!")

            VStack(spacing: 10) {
                Text(lesson.phrase)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text(lesson.translation)
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Text(lesson.example)
                    .font(.callout)
                    .foregroundStyle(.tertiary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 24))

            Button {
                speak()
            } label: {
                Label("Прослушать", systemImage: "speaker.wave.3.fill")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue, in: RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.white)
            }

            Button {
                store.completeLesson(lesson)
                isCompleted = true
            } label: {
                Label(isCompleted ? "Урок завершён" : "Завершить урок", systemImage: "checkmark.circle.fill")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isCompleted ? .gray : .green, in: RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.white)
            }
            .disabled(isCompleted)
        }
        .padding()
        .navigationTitle(lesson.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func speak() {
        synthesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: lesson.phrase)
        utterance.voice = AVSpeechSynthesisVoice(language: lesson.language.code)
        utterance.rate = 0.42
        synthesizer.speak(utterance)
    }
}
