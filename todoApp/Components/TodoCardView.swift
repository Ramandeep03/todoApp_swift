//
//  TodoCardView.swift
//  todoApp
//
//  Created by Ramandeep Singh on 01/09/24.
//

import SwiftUI

struct TodoCardView: View {
    var item : TodoItem
    @Environment(\.modelContext) private var context
    private let todoRepository = TodoRepository()
    
    @State var showSheet:Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .lineLimit(1)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.primary)
                    .strikethrough(item.isCompleted, color: .primary)
                Text(item.details)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .strikethrough(item.isCompleted, color: .primary)
            }
            Spacer()
            CheckBox(item: item) { updatedItem in
                todoRepository.updateItem(context: context, item: updatedItem)
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onTapGesture {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            NavigationView{
                VStack (alignment: .leading, spacing: 10){
                    HStack (alignment: .top){
                        Text(item.title)
                            .font(.title)
                            .bold()
                        Spacer(minLength: 5)
                        CheckBox(item: item) { updatedItem in
                            todoRepository.updateItem(context: context, item: updatedItem)
                        }
                    }
                    .padding(.vertical,8)
                    
                    Text(item.details)
                    Spacer(minLength: 0)
                }
                .presentationDetents([.medium])
                .padding()
            }
        }
        )
    }
}

//#Preview {
//    TodoCardView()
//}
