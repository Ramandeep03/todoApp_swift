//
//  AddTodoView.swift
//  todoApp
//
//  Created by Ramandeep Singh on 31/08/24.
//

import SwiftUI

struct AddTodoView: View {
    @Binding var isPresented: Bool
    @State private var showAlert = false
    @State private var title: String = ""
    @State private var details: String = ""
    
    var onSave: (String, String) -> Void
    
    
    var body: some View {
        NavigationView {
            VStack (alignment:.leading,spacing: 20){
                TextField("Title", text: $title)
                    .padding()
                    .background(.onAccent)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                Text("Details")
                    .font(.title3)
                    .bold()
                
                TextEditor(text: $details)
                    .textEditorStyle(.plain)
                    .frame(height: 200)
                    .padding()
                    .background(.onAccent)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                Spacer()
                
            }
            .padding()
            .navigationTitle("Add Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if title.isEmpty || details.isEmpty {
                            showAlert = true
                        } else {
                            onSave(title, details)
                            isPresented = false
                        }                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Missing Information"),
                    message: Text("Please fill in both the title and details."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    AddTodoView(isPresented: .constant(true), onSave: { title, details in
        print("Title: \(title), Details: \(details)")
    })
}
