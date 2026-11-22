import SwiftUI

struct DinoView: View {
    let message: String

    var body: some View {
        HStack(spacing: 16) {
            Text("🦖")
                .font(.system(size: 56))

            Text(message)
                .font(.body.weight(.medium))
                .padding()
                .background(.green.opacity(0.15), in: RoundedRectangle(cornerRadius: 18))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Дино-завр говорит: \(message)")
    }
}
