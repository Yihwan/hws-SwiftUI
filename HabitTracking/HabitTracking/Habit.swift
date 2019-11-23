//
//  Habit.swift
//  HabitTracking
//
//  Created by Yihwan Kim on 11/23/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import Foundation

struct Habit: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    var count: Int
}
