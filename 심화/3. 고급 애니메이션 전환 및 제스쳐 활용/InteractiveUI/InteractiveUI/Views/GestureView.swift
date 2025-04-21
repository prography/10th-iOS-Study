//
//  GestureView.swift
//  InteractiveUI
//
//  Created by minsong kim on 4/20/25.
//

import SwiftUI

struct GestureView: View {
    @GestureState private var isPressed = false
    @State private var offset = CGSize.zero

    var body: some View {
        Circle()
            .fill(isPressed ? Color.blue : Color.red)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .sequenced(before: DragGesture())
                    .updating($isPressed) { value, state, _ in
                        if case .first(true) = value {
                            state = true
                        }
                    }
                    .onEnded { value in
                        if case .second(true, let drag?) = value {
                            offset = drag.translation
                        }
                    }
            )
    }
}
