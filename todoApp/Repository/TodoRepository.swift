//
//  TodoRepository.swift
//  todoApp
//
//  Created by Ramandeep Singh on 31/08/24.
//

import Foundation
import SwiftData

class TodoRepository{
    
    func addItem(_ context: ModelContext, item: TodoItem){
        context.insert(item)
    }
    
    func deleteItem(_ context: ModelContext, item: TodoItem){
        context.delete(item)
        saveContext(context)
    }
    func updateItem(context: ModelContext, item: TodoItem) {
        saveContext(context)
    }
    private func saveContext(_ context: ModelContext) {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}
