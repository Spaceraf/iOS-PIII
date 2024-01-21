import SwiftUI

struct ContentView: View {
    @State private var tracks: [Track] = []

    var body: some View {
        NavigationView {
            List(tracks, id: \.id) { track in // Ensure Track conforms to Identifiable or provide an explicit id
                NavigationLink(destination: TrackView(track: track)) {
                    Text(track.name)
                }
            }
            .navigationBarTitle("Conference Tracks")
        }
    }
}

// Ensure Track conforms to Identifiable
struct Track: Identifiable {
    let id: UUID = UUID() // Provide a default UUID
    var name: String
    var articles: [Article]
}

struct TrackView: View {
    var track: Track

    var body: some View {
        Text("Implement your TrackView here")
        // Implementation of your TrackView
    }
}

// Ensure Article conforms to Identifiable
struct Article: Identifiable {
    let id: UUID = UUID() // Provide a default UUID
    // Your Article properties
}

// Dummy view to satisfy compiler, replace with your actual ArticleView implementation
struct ArticleView: View {
    var body: some View {
        Text("Article View")
    }
}
