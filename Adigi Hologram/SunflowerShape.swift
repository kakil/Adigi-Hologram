//
//  SunflowerShape.swift
//  Adigi Hologram
//
//  Created by Kitwana Akil on 5/22/23.
//

import SwiftUI

struct SunflowerShape: Shape {
    let seedCount: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let angleIncrement = 2 * Double.pi * (1.0 - (1.0 / Constants.goldenRatio))
        let maxRadius = min(rect.width, rect.height) * 0.5
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)

        for i in 0..<seedCount {
            let radius = sqrt(Double(i)) * maxRadius / sqrt(Double(seedCount))
            let angle = Double(i) * angleIncrement
            let x = center.x + CGFloat(radius * cos(angle))
            let y = center.y + CGFloat(radius * sin(angle))
            let circleSize = CGFloat(1.0 - (radius / maxRadius)) * 8
            let circle = Path(ellipseIn: CGRect(x: x - circleSize * 0.5, y: y - circleSize * 0.5, width: circleSize, height: circleSize))
            path.addPath(circle)
        }

        return path
    }

    struct Constants {
        static let goldenRatio: Double = 1.61803398875
    }
}
