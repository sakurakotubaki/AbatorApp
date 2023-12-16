import SwiftUI
import Foundation
import URLImage

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.users, id: \.id) { user in
            HStack {
                URLImage(URL(string: user.avatar)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                Text(user.first_name + " " + user.last_name)
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
