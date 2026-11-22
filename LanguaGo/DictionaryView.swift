import SwiftUI

struct DictionaryView: View {
    @ObservedObject var state: AppState

    var body: some View {
        NavigationStack {
            List {
                if state.words.isEmpty {
                    ContentUnavailableView(
                        "Словарь пуст",
                        systemImage: "book.closed",
                        description: Text("Заверши урок, чтобы добавить первую фразу.")
                    )
                } else {
                    ForEach(state.words) { word in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(word.original)
                                .font(.headline)
                            Text(word.translation)
                                .foregroundStyle(.secondary)
                            Text(word.language.rawValue)
                                .font(.caption)
                                .foregroundStyle(.tertiary)
                        }
                    }
                }
            }
            .navigationTitle("Мой словарь")
        }
    }
}
