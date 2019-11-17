//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Alter Ego on 11/17/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var upToInteger = 5
    @State private var numQuestionsIndex = 2
    @State private var questions = [[Int]]()
    @State private var currentQuestionIndex = 0
    @State private var gameStarted = false
    @State private var gameEnded = false
    @State private var userAnswer = ""
    @State private var numCorrect = 0
    private var numQuestions = [1, 5, 10]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Stepper("Up to number: \(upToInteger)", value: $upToInteger, in: 1...9)
                    
                    Picker(selection: $numQuestionsIndex, label: Text("How many questions?")) {
                        Text("1").tag(0)
                        Text("5").tag(1)
                        Text("10").tag(2)
                        Text("All").tag(3)
                    }
                    
                    Button(action: startGame) {
                        gameStarted ? Text("Reset Game") : Text("Start Game")
                    }
                }
                
                if gameStarted {
                    Section {
                        Text("What is \(questions[currentQuestionIndex][0]) * \(questions[currentQuestionIndex][1])?")
                        TextField("Enter your answer (press return to submit)", text: $userAnswer, onCommit: checkProduct)
                            .keyboardType(.decimalPad)
                    }
                    
                    Text("Questions answered correctly: \(numCorrect)")
                }
                
                if gameEnded {
                    Text("Game over")
                    Text("Number of correct questions: \(numCorrect)")
                }
            }
            .navigationBarTitle("Multiplication Tables")
        }
    }
    
    func startGame() {
        currentQuestionIndex = 0
        numCorrect = 0
        
        var potentialQuestions = [[Int]]()
        
        for idx in 1...upToInteger {
            for jdx in 1...upToInteger {
                potentialQuestions.append([idx, jdx])
            }
        }
        
        if numQuestionsIndex == 3 {
            questions = potentialQuestions.shuffled()
            return
        }
        
        questions = Array(potentialQuestions.shuffled()[0..<numQuestions[numQuestionsIndex]])
        
        gameEnded = false
        gameStarted = true
    }
    
    func checkProduct() {
        if currentQuestionIndex >= questions.count - 1 {
            endGame()
        }
        
        if Int(userAnswer) == (questions[currentQuestionIndex][0] * questions[currentQuestionIndex][1]) {
            numCorrect += 1
        }
        
        userAnswer = ""
        currentQuestionIndex += 1
    }
    
    func endGame() {
        gameStarted = false
        gameEnded = true
        print("Game over")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
