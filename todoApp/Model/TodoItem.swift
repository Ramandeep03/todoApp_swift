//
//  TodoItem.swift
//  todoApp
//
//  Created by Ramandeep Singh on 31/08/24.
//

import Foundation
import SwiftData

@Model
class TodoItem: ObservableObject{
    var id: String
    var title: String
    var details: String
    var isCompleted:Bool
    
    init(title: String, details: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.details = details
        self.isCompleted = isCompleted
    }
}
