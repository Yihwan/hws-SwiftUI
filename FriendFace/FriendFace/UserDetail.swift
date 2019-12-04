//
//  UserDetail.swift
//  FriendFace
//
//  Created by Yihwan Kim on 11/28/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct UserDetail: View {
    let user: User
    
    var body: some View {
//        List {
//            Section(header: Text("Examples")) {
//                Text("ExampleRow")
//            }
//        }.listStyle(GroupedListStyle())
        VStack {
            HStack() {
                Text(user.name)
                    .font(.title)
                    .fontWeight(.heavy)

                Spacer()

                VStack(alignment: .trailing) {
                    Text(user.email)
                        .fontWeight(.light)
                }
            }
            .padding()

            VStack(spacing: 10) {
                Text(user.about)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding()

            NavigationLink(destination: Text("asdsad")) {
                Text("HASDSA")
            }
            
            List {
                Section(header: Text("Friends")) {
                    NavigationLink(destination: Text("asdsad")) {
                        Text("HASDSA")
                    }
                }
            }.listStyle(GroupedListStyle())
            
            Text("MORE")
            Text("MORE")
            Text("MORE")

            Spacer()
            Text("MORE")
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
        .navigationBarTitle(Text(user.name), displayMode: .inline)
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(user: User())
    }
}


