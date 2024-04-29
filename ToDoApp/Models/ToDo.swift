//
//  ToDo.swift
//  ToDoApp
//
//  Created by Vincent on 2024/04/28.
//

import Foundation
import SwiftData

@Model
final class ToDo: Identifiable {
    
    @Attribute(.unique) var id: String = UUID().uuidString
    var name: String
    var note: String
    
    init(id: String = UUID().uuidString, name: String, note: String) {
        self.id = id
        self.name = name
        self.note = note
    }
}
