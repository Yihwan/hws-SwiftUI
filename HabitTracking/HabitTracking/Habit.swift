//
//  Habit.swift
//  HabitTracking
//
//  Created by Yihwan Kim on 11/23/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import Foundation

class Habit: ObservableObject, Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var count: Int
    
    init(name: String, description: String, count: Int) {
        self.name = name
        self.description = description
        self.count = count
    }
}
