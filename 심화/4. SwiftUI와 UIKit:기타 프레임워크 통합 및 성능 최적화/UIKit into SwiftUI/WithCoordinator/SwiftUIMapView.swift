//
//  SwiftUIMapView.swift
//  AppleLogin
//
//  Created by 신정욱 on 4/20/25.
//

import SwiftUI

struct SwiftUIMapView: View {
    @State var authStateText = "인증 대기중.."
    
    var body: some View {
        VStack(spacing: 15) {
            Text(authStateText)
                .font(.title3)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            MapVCRepresentable(authStateText: $authStateText)
        }
    }
}

#Preview {
    SwiftUIMapView()
}
