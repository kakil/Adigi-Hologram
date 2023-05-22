//
//  HologramView.swift
//  Adigi Hologram
//
//  Created by Kitwana Akil on 5/22/23.
//

import SwiftUI

struct HologramView: View {
    @State private var animationProgress: CGFloat = 0.0

    var body: some View {
        SunflowerPattern(progress: $animationProgress)
            .stroke(Color.blue, lineWidth: 2)
            .animation(.easeInOut, value: animationProgress)
            .onTapGesture {
                withAnimation {
                    self.animationProgress = self.animationProgress == 0.0 ? 1.0 : 0.0
                }
            }
    }
}

struct HologramEffect: AnimatableModifier {
    @Binding var progress: CGFloat
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(1.0 + progress * 0.1) // Adjust scale factor as needed
            .rotationEffect(Angle(degrees: Double(progress) * 360.0)) // Rotate the pattern
            .opacity(1.0 - progress * 0.5) // Adjust the opacity
    }
}

struct HologramView_Previews: PreviewProvider {
    static var previews: some View {
        HologramView()
    }
}
