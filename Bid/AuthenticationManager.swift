

class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    private init() {}
    
    // MARK: - User Authentication
    
    func registerUser(email: String, password: String, completion: @escaping (Result<User?, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                let user = authResult.user
                completion(.success(user))
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Result<User?, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let authResult = authResult {
                let user = authResult.user
                completion(.success(user))
            }
        }
    }
    
    func logoutUser() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Current User
    
    func getCurrentUser() -> User? {
        return Auth.auth().currentUser
    }
}
