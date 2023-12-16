import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}

struct UserList: Codable {
    let data: [User]
}

