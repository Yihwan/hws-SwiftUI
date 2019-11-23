//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by Yihwan Kim on 11/23/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: Habits
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var description = ""
    @State private var isAlertShown = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add Habit")
            .navigationBarItems(trailing: Button(action: saveHabit) {
                Text("Add")
            })
        }
        .alert(isPresented: $isAlertShown) {
            Alert(title: Text("Invalid input"), message: Text("Name field is required"), dismissButton: .default(Text("OK")))
        }
    }
    
    func saveHabit() {
        if name == "" {
            isAlertShown = true
            return
        }
        let newHabit = Habit(name: name, description: description, count: 0)
        
        habits.habitItems.append(newHabit)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
