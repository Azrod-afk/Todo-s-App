import Foundation
import SwiftUI

struct RoundedToggleStyleConfiguration: ToggleStyle {
    
    private let lineWidth : CGFloat = 2
    
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        
        func toggle() {
            withAnimation(.bouncy) {
                configuration.isOn.toggle()
            }
        }
        
        return Button(action: toggle) {
            ZStack {
                Circle().stroke(.gray, lineWidth: lineWidth).opacity(isOn ? 0 : 1)
                
                Circle().fill(.blue).opacity(isOn ? 1 : 0).scaleEffect(
                    isOn ? 1 : 0
                ).padding(3)
                
                Circle().stroke(.blue, lineWidth: lineWidth).opacity(isOn ? 1 : 0)
            }
        }
    }
    
    
}
