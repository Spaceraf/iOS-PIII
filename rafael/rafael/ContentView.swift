struct ContentView: View {
    @State private var tracks: [Track] = []

    var body: some View {
        NavigationView {
            List(tracks) { track in
                NavigationLink(destination: TrackView(track: track)) {
                    Text(track.name)
                }
            }
            .navigationBarTitle("Conference Tracks")
        }
    }
}
