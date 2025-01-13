//
//  ContentView.swift
//  Animation Watch App
//
//  Created by Maxim Dmitrochenko on 1/13/25.
//

import SwiftUI

struct ContentView: View {

    @State private var angle = 0.0
    
    var body: some View {
        ZStack {
            Arrow()
                .rotationEffect(.degrees(angle))
                .animation(Animation.easeInOut(duration: 0.2))
                .foregroundStyle(.accent)
                .focusable()
                .digitalCrownRotation(
                    detent: $angle,
                    from: 0.0,
                    through: 1000000.0,
                    by: 30.0,
                    sensitivity: .high,
                    isContinuous: true,
                    isHapticFeedbackEnabled: true
                )
            
            Circle()
                .stroke(lineWidth: 30)
                .foregroundStyle(.blue.opacity(0.3))
                .frame(width: 170, height: 170)
            
            Points(size: 15)
            
            Points(size: 10)
                .rotationEffect(.degrees(30))
                .opacity(0.5)
            
            Points(size: 10)
                .rotationEffect(.degrees(60))
                .opacity(0.5)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

#Preview {
    ContentView()
}

struct Arrow: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
            
            Triangle()
                .frame(width: 30, height: 30)
                .offset(y: -18)
            
            
        }
        .padding()
    }
}

struct Points: View {
    
    public let size: CGFloat
    
    private let degrees = [0.0, 90.0, 180.0, 270.0]
    
    var body: some View {
        
        ForEach(degrees, id: \.self) { degree in
            Circle()
                .frame(width: size, height: size)
                .offset(x: -85)
                .foregroundStyle(.accent)
                .rotationEffect(.degrees(degree))
        }
    }
}
