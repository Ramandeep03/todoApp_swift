//
//  CheckBox.swift
//  todoApp
//
//  Created by Ramandeep Singh on 31/08/24.
//

import SwiftUI
import SwiftData

struct CheckBox: View {
    @ObservedObject var item : TodoItem
    var onCheck: (TodoItem) -> Void
    var body: some View {
        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
            .foregroundColor(item.isCompleted ? .green :  .secondary)
            .font(.system(size: 22))
            .onTapGesture {
                withAnimation{
                    item.isCompleted.toggle()
                    onCheck(item)
                }
            
            }
    }
}

//#Preview {
//    CheckBox(item: TodoItem(title: "This is sample", details: "This is details", isCompleted: true))
//}
