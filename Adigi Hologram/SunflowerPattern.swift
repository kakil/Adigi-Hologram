//
//  SunflowerPattern.swift
//  Adigi Hologram
//
//  Created by Kitwana Akil on 5/22/23.
//

import SwiftUI

struct SunflowerPattern: Shape {
    @Binding var progress: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let goldenAngle = CGFloat.pi * (3 - sqrt(5))
        let count = Int(rect.width) * 5

        for i in 0..<count {
            let phi = goldenAngle * CGFloat(i)
            let r = sqrt(CGFloat(i)) * radius / sqrt(CGFloat(count)) * progress
            let x = center.x + r * cos(phi)
            let y = center.y + r * sin(phi)
            let circle = Path(ellipseIn: CGRect(x: x-1, y: y-1, width: 2, height: 2))
            path.addPath(circle)
        }

        return path
    }
}

