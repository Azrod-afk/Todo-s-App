import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todoLists: [TodoList]

    var body: some View {
        if (todoLists.first?.items.isEmpty ?? true) {
            addItem()
        }
        return NavigationSplitView {
                ForEach(todoLists) { list in
                    TodoListView(todoList: todoLists.first!)
                }

            #if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            #endif
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Label("Test", systemImage: "chevron.left")
                    }
                }

                ToolbarSpacer()

                ToolbarItemGroup {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }

            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        let newItem = Todo("Todo #" + String(((todoLists.first?.items.count ?? 0) + 1)))
        if todoLists.isEmpty {
            let todoList = TodoList(
                name: "Aujourd'hui",
                color: Color.red.description
            )
            modelContext.insert(todoList)
        }
        todoLists.first?.addItem(newItem)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Todo.self, TodoList.self], inMemory: true)
}
