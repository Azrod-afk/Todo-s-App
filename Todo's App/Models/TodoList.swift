import SwiftUI
import Foundation
import SwiftData

@Model
final class TodoList {
    var name: String
    var color: String
    var items: [Todo]
    
    init(name: String, color: String, items: [Todo] = []) {
        self.name = name
        self.color = color
        self.items = items
    }
    
    func addItem(_ item: Todo) {
        item.index = items.count
        items.append(item)
    }
}
