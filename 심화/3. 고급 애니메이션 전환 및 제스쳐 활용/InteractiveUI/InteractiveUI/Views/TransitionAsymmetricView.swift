//
//  TransitionAsymmetricView.swift
//  InteractiveUI
//
//  Created by minsong kim on 4/21/25.
//

import SwiftUI

struct TransitionAsymmetricView: View {
    @State private var show = false

    var body: some View {
        VStack(spacing: 20) {
            Button("Toggle Box") {
                withAnimation {
                    show.toggle()
                }
            }

            if show {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .slide, removal: .opacity))
            }
        }
    }
}
