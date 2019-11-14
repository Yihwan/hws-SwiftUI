//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alter Ego on 11/13/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct Caption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.red)
            .padding()
    }
}

extension View {
    func captionStyle() -> some View {
        self.modifier(Caption())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .captionStyle()
            
        }
    }
    

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
