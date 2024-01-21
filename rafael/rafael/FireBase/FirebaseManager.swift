import Foundation
import Firebase
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager() // Singleton instance
    private let db = Firestore.firestore()

    // Fetch tracks and their associated articles
    func fetchTracks(completion: @escaping ([Track]) -> Void) {
        db.collection("tracks").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("No documents in 'tracks'")
                return
            }

            var tracks: [Track] = []
            for document in documents {
                let data = document.data()
                let name = data["name"] as? String ?? "Unknown Track"
                
                // Example of fetching articles for each track
                // Assuming 'articles' is a subcollection under each 'track'
                self.fetchArticles(forTrackID: document.documentID) { articles in
                    let track = Track(name: name, articles: articles)
                    tracks.append(track)
                }
            }
            completion(tracks)
        }
    }

    // Fetch articles for a specific track
    func fetchArticles(forTrackID trackID: String, completion: @escaping ([Article]) -> Void) {
        db.collection("tracks").document(trackID).collection("articles").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("No articles found for track \(trackID)")
                return
            }

            let articles = documents.map { doc -> Article in
                let data = doc.data()
                let title = data["title"] as? String ?? "Unknown Title"
                let authors = data["authors"] as? [String] ?? []
                // Add additional fields like startTime, endTime, location as required

                return Article(title: title, authors: authors)
            }
            completion(articles)
        }
    }

    // Additional functions for authentication, adding questions etc., can be added here
}
