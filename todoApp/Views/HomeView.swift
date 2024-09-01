import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query private var items: [TodoItem]
    
    private let todoRepository = TodoRepository()
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            Group {
                if items.isEmpty {
                    Text("No Todo's Added")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                } else {
                    List {
                        ForEach(items, id: \.self.id) { item in
                         TodoCardView(item: item)
                            .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            .listRowSeparator(.hidden)
                        }
                        .onDelete { indexes in
                            for index in indexes {
                                todoRepository.deleteItem(context, item: items[index])
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Todo's")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.primary)
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                AddTodoView(isPresented: $showSheet) { title, details in
                    todoRepository.addItem(context, item: TodoItem(title: title, details: details, isCompleted: false))
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
