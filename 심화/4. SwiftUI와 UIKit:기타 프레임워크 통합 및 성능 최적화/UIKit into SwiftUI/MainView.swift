//
//  MainView.swift
//  UIViewInSwiftUI
//
//  Created by 신정욱 on 4/20/25.
//

import SwiftUI

struct MainView: View {
    
    @State var color: Color = .gray
    
    var body: some View {
        VStack(spacing: 15) {
            JustUIViewRepresentable(color: UIColor(color))
                .padding(.horizontal, 15)
                .animation(.default, value: color)
                

            Button {
                color = .black
            } label: {
                Text("버튼 꾹")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 15)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MainView()
}
