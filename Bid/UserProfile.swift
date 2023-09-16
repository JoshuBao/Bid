import Foundation

class UserProfile {
    var uid: String
    var fullName: String
    var profilePictureURL: URL?
    var fraternity: String?
    
    init(uid: String, fullName: String, profilePictureURL: URL? = nil, fraternity: String? = nil) {
        self.uid = uid
        self.fullName = fullName
        self.profilePictureURL = profilePictureURL
        self.fraternity = fraternity
    }
}
