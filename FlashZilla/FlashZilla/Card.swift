//
//  Card.swift
//  FlashZilla
//
//  Created by Yihwan Kim on 2/14/20.
//  Copyright © 2020 Yihwan Kim. All rights reserved.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String

    static var example: Card {
        return Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
