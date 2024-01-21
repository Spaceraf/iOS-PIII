import SwiftUI

struct ArticleView: View {
    var article: Article

    var body: some View {
        VStack {
            Text(article.title).font(.subheadline)
            Text("Authors: \(article.authors.joined(separator: ", "))")
            Text("Time: \(formatDate(article.startTime)) - \(formatDate(article.endTime))")
            Text("Location: \(article.location)")
        }
    }

    private func formatDate(_ date: Date) -> String {
        // Format the date as needed
    }
}
