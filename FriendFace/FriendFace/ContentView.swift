//
//  ContentView.swift
//  FriendFace
//
//  Created by Yihwan Kim on 11/28/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
          TabView {
              AllUsersView()
                  .tabItem {
                      Image(systemName: "1.circle")
                      Text("All Users")
                  }.tag(0)
              Text("My Friends")
                  .tabItem {
                      Image(systemName: "2.circle")
                      Text("My Friends")
                  }.tag(1)
                Text("Me")
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("Me")
                    }.tag(2)
          }
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
