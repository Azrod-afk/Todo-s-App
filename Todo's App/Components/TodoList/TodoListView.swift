import SwiftUI

struct TodoListView: View {
    @State var todoList: TodoList
    
    var body: some View {
        ScrollView {
            Text(todoList.name)
                .font(.largeTitle)
                .fontDesign(.rounded)
                .bold()
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(todoList.items.sorted(by: { item, nextItem in
                item.index < nextItem.index
            })) { item in
                TodoItemSummary(
                    title: item.name
                )
            }
        }
        .frame(maxWidth: .infinity).padding()
    }
}

#Preview {
    let todoList = TodoList(name: "My Todo's", color: "red", items: [
        Todo("Todo #1"),
        Todo("Todo #2")
    ])
    TodoListView(todoList: todoList)
}
