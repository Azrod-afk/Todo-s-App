import Foundation
import SwiftData

@Model
final class Todo {
    var index: Int = 0
    var name: String
    var deadline: Date
    
    init(_ name: String) {
        self.name = name
        self.deadline = Date()
    }
}
