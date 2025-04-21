//
//  ImplicitAnimationView.swift
//  InteractiveUI
//
//  Created by minsong kim on 4/21/25.
//

import SwiftUI

struct ImplicitAnimationView: View {
    @State private var isOn = false

    var body: some View {
        Circle()
            .fill(isOn ? Color.green : Color.red)
            .frame(width: isOn ? 200 : 100, height: isOn ? 200 : 100)
            .onTapGesture {
                isOn.toggle()
            }
            .animation(.easeInOut, value: isOn)
    }
}
