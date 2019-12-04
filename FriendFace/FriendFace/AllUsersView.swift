//
//  AllUsersView.swift
//  FriendFace
//
//  Created by Yihwan Kim on 11/28/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct AllUsersView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink(destination: UserDetail(user: user)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text(user.email)
                                .font(.caption)
                        }
                        Spacer()
                        Text(user.company)
                            .padding([.horizontal])
                    }
                }
            }
            .navigationBarTitle("All Users")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                self.users = decoded
            } else {
                dump(error)
            }
        }.resume()
    }
}

struct AllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        AllUsersView()
    }
}
