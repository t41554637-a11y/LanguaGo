import SwiftUI

struct DictionaryView: View {
    @EnvironmentObject private var store: ProgressStore
    @State private var searchText = ""

    var filteredWords: [VocabularyWord] {
        if searchText.isEmpty { return store.words }
        return store.words.filter {
            $0.original.localizedCaseInsensitiveContains(searchText) ||
            $0.translation.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                if store.words.isEmpty {
                    ContentUnavailableView(
                        "Словарь пуст",
                        systemImage: "book.closed",
                        description: Text("Заверши урок, чтобы добавить первую фразу.")
                    )
                } else {
                    ForEach(filteredWords) { word in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(word.original)
                                    .font(.headline)
                                Spacer()
                                Text(word.language.flag)
                            }
                            Text(word.translation)
                                .foregroundStyle(.secondary)
                            Text(word.example)
                                .font(.caption)
                                .foregroundStyle(.tertiary)

                            if !word.isLearned {
                                Button("Выучено") {
                                    store.markLearned(word)
                                }
                                .buttonStyle(.bordered)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Найти слово или перевод")
            .navigationTitle("Мой словарь")
        }
    }
}
