import Firebase

class QuestionManager {
    static let shared = QuestionManager() // Singleton instance
    private let db = Firestore.firestore()

    // Submit a question for a specific article
    func submitQuestion(forArticle articleID: String, question: String, completion: @escaping (Bool, Error?) -> Void) {
        let data = ["question": question, "timestamp": FieldValue.serverTimestamp()]
        db.collection("articles").document(articleID).collection("questions").addDocument(data: data) { error in
            completion(error == nil, error)
        }
    }

    // Fetch questions for a specific article
    func fetchQuestions(forArticle articleID: String, completion: @escaping ([String]) -> Void) {
        db.collection("articles").document(articleID).collection("questions").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("No questions found for article \(articleID)")
                completion([])
                return
            }

            let questions = documents.map { $0.data()["question"] as? String ?? "Unknown Question" }
            completion(questions)
        }
    }
}
