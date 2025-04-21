//
//  ContentView.swift
//  InteractiveUI
//
//  Created by minsong kim on 4/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Gesture Example", destination: GestureView())
                NavigationLink("Transition Example", destination: TransitionView())
                NavigationLink("Transition Asymmetric Example", destination: TransitionAsymmetricView())
                NavigationLink("Animation Example", destination: AnimationView())
                NavigationLink("Implicit Animation Example", destination: ImplicitAnimationView())
            }
        }
    }
}

#Preview {
    ContentView()
}
