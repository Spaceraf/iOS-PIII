import SwiftUI

struct Track: Identifiable {
    let id = UUID()
    var name: String
    var articles: [Article]
}


