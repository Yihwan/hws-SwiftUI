//
//  HabitDetail.swift
//  HabitTracking
//
//  Created by Yihwan Kim on 11/23/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct HabitDetail: View {
    @ObservedObject var habit: Habit
    
    var body: some View {
        NavigationView {
            Form {
                Text(habit.name)
                Text(habit.description)
                Stepper(value: $habit.count, in: 0...20) {
                    Text("Count: \(habit.count)")
                }
            }
            .navigationBarTitle(habit.name)
        }
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetail(habit: Habit(name: "Walk dog", description: "Do it everyday", count: 0))
    }
}
