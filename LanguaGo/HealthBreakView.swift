import SwiftUI

struct HealthBreakView: View {
    @EnvironmentObject private var store: ProgressStore
    @State private var completed = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Здоровый образ жизни", systemImage: "figure.walk")
                .font(.headline)

            Text("Сделай 30-секундную разминку и выпей воды.")
                .foregroundStyle(.secondary)

            Button {
                store.completeHealthBreak()
                completed = true
            } label: {
                Label(completed ? "Готово! Молодец!" : "Отметить выполненным", systemImage: completed ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.bordered)
            .disabled(completed)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.mint.opacity(0.15), in: RoundedRectangle(cornerRadius: 20))
    }
}
