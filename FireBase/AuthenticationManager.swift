import Firebase

class AuthenticationManager {
    static let shared = AuthenticationManager() // Singleton instance

    // Sign Up User
    func signUp(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            completion(authResult != nil, error)
        }
    }

    // Sign In User
    func signIn(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completion(authResult != nil, error)
        }
    }

    // Sign Out User
    func signOut() throws {
        try Auth.auth().signOut()
    }

    // Check Current User
    var isUserLoggedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
