import SwiftUI

struct TodoItemSummary: View {
    @State var checked = false
    @State var title: String
    
    init(title: String) {
        self.title = title
    }

    var body: some View {
        HStack(spacing: 20) {
            RoundedToggle(label: "Checked", isOn: $checked).padding(2)
            Text(title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TodoItemSummary(title: "Test Todo")
}
