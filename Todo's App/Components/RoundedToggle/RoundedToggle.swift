import SwiftUI

struct RoundedToggle: View {
    @Binding var isOn: Bool
    private var label: String
    
    init(label: String, isOn: Binding<Bool>) {
        self._isOn = isOn
        self.label = label
    }

    var body: some View {
        Toggle(label, isOn: $isOn).toggleStyle(
            RoundedToggleStyleConfiguration()
        ).frame(width: 25.0, height: 25.0).buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    struct Preview: View {
        @State var isOn = false
        var body: some View {
            RoundedToggle(label: "Test", isOn: $isOn)
        }
    }
    
    return Preview()
}
