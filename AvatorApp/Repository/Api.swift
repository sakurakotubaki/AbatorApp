import Foundation
import Combine

class Api: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    func getUsers() -> AnyPublisher<UserList, Error> {
        guard let url = URL(string: "https://reqres.in/api/users") else {
            fatalError("Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: UserList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
