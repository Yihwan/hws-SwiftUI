//
//  Prospect.swift
//  HotProspects
//
//  Created by Yihwan Kim on 2/10/20.
//  Copyright © 2020 Yihwan Kim. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]

    init() {
        self.people = []
    }
}