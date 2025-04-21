//
//  TransitionView.swift
//  InteractiveUI
//
//  Created by minsong kim on 4/20/25.
//

import SwiftUI

struct BlurModifier: ViewModifier {
    let amount: CGFloat

    func body(content: Content) -> some View {
        content
            .blur(radius: amount)
            .opacity(1 - Double(amount / 10))
    }
}

extension AnyTransition {
    static var blurFade: AnyTransition {
        .modifier(
            active: BlurModifier(amount: 10),
            identity: BlurModifier(amount: 0)
        )
    }
}

struct TransitionView: View {
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
                    .transition(.blurFade)
            }
        }
    }
}
