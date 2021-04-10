//
//  ContentView.swift
//  DrawingChallenge
//
//  Created by Brandon Knox on 4/10/21.
//

import SwiftUI

struct Arrow: Shape {
//    var lineWidth: CGFloat
//
//    var animatableData: CGFloat {
//        get { lineWidth }
//        set { self.lineWidth = newValue }
//    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        path.move(to: CGPoint(x: rect.maxX * 0.25, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.25, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.75, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 0.75, y: rect.midY))
        
        return path
    }
}

struct ContentView: View {
    @State private var lineWidth: CGFloat = 5.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(Color.green, lineWidth: lineWidth)
                .frame(width:200, height: 300)
            Slider(value: $lineWidth, in: 0...100)
                .padding([.horizontal, .bottom])
            Text("Line Width: \(lineWidth, specifier: "%.2f")")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
