//
//  ContentView.swift
//  HabitTracking
//
//  Created by Yihwan Kim on 11/23/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var isAddViewShown = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.habitItems) { habit in
                    NavigationLink(destination: HabitDetail(habit: habit)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .fontWeight(.bold)
                                Text(habit.description)
                            }
                            Spacer()
                            Text("\(habit.count)")
                        }
                    }
                }
                .onDelete(perform: removeHabits)
            }
            .navigationBarTitle("Habits")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.isAddViewShown = true 
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isAddViewShown) {
                AddHabitView(habits: self.habits)
            }
        }
    }
    
    func removeHabits(at offsets: IndexSet) {
        habits.habitItems.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Habits: ObservableObject {
    @Published var habitItems = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(habitItems) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let habits = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: habits) {
                self.habitItems = decoded
                return
            }
        }
        
        self.habitItems = []
    }
}
