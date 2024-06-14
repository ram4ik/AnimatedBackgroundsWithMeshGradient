//
//  ContentView.swift
//  AnimatedBackgroundsWithMeshGradient
//
//  Created by Ramill Ibragimov on 14.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MeshGadientView: View {
    @State private var isAnimating = false
    
    let colors1 = (0..<9).map { _ in [Color.green, .blue, .cyan].randomElement()! }
    let colors2 = (0..<9).map { _ in [Color.green, .blue, .cyan].randomElement()! }
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                .init(x: 0, y: 0.5), .init(x: 0.5, y: 0.5), .init(x: 1, y: 0.5),
                .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1),
            ],
            colors: isAnimating ? colors1 : colors2
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 5).repeatForever()) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
