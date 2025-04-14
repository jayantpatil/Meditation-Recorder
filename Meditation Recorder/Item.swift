//
//  Item.swift
//  Meditation Recorder
//
//  Created by Jayant Patil on 14/04/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
