//
//  ContentView.swift
//  WeirdRockPaperScissors
//
//  Created by Alter Ego on 11/14/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedMove = 0
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var isAlertPresented = false
    @State private var alertTitle = ""
    
    private var possibleMoves = ["Rock", "Paper", "Scissors"]
    private var winLossMap = [
        "Rock": ["Paper", "Scissors"],
        "Paper": ["Scissors", "Rock"],
        "Scissors": ["Rock", "Paper"]
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Score: \(score)")
            
            VStack {
                Text("Computer chose:")
                Text(possibleMoves[selectedMove])
            }
            
            VStack {
                
                Text("Computer says you must:")
                Text(shouldWin ? "Win" : "Lose")
            }
            
            ForEach(0 ..< possibleMoves.count) { number in
                Button(action: {
                    self.moveTapped(number)
                }) {
                    Text(self.possibleMoves[number])
                }
            }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text(alertTitle), message: Text("Your new score \(score)"), dismissButton: .default(Text("Continue")) {
                self.resetRound()
            })
        }
    }
    
    func moveTapped(_ number: Int) {        
        let selectedMoveString = possibleMoves[selectedMove]
        var correctMoveString = ""
        
        if let winLossArray = winLossMap[selectedMoveString] {
            if shouldWin {
                correctMoveString = winLossArray[0]
            } else {
                correctMoveString = winLossArray[1]
            }
        }
        
        if possibleMoves[number] == correctMoveString {
            alertTitle = "Correct"
            score += 1
        } else {
            alertTitle = "Incorrect"
            score -= 1
        }
        
        isAlertPresented = true
    }
    
    func resetRound() {
        shouldWin = Bool.random()
        selectedMove = Int.random(in: 0 ..< possibleMoves.count)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
