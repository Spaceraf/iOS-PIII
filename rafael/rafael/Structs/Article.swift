struct Article: Identifiable {
    let id = UUID()
    var title: String
    var authors: [String]
    var startTime: Date
    var endTime: Date
    var location: String
}
