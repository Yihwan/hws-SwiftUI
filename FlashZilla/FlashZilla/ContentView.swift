//
//  ContentView.swift
//  FlashZilla
//
//  Created by Yihwan Kim on 2/13/20.
//  Copyright © 2020 Yihwan Kim. All rights reserved.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct ContentView: View {
    @State private var cards = [Card](repeating: Card.example, count: 10)

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: self.cards[index]) {
                           withAnimation {
                               self.removeCard(at: index)
                           }
                        }
                        .stacked(at: index, in: self.cards.count)
                    }
                }
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
