struct TrackView: View {
    var track: Track

    var body: some View {
        VStack(alignment: .leading) {
            Text(track.name).font(.headline)
            ForEach(track.articles) { article in
                ArticleView(article: article)
            }
        }
    }
}
