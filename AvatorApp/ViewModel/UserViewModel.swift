import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var users = [User]()
    private var api = Api()
    // Combineをimportしないと、Cannot find type 'AnyCancellable' in scopeになる
    private var cancellables = Set<AnyCancellable>()

    func fetchUsers() {
        api.getUsers()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { userList in
                self.users = userList.data
            }
            .store(in: &cancellables)
    }
}
