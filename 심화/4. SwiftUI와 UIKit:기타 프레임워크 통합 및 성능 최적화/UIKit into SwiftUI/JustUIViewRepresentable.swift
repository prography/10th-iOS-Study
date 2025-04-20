//
//  JustUIViewRepresentable.swift
//  UIViewInSwiftUI
//
//  Created by 신정욱 on 4/20/25.
//

import UIKit
import SwiftUI

struct JustUIViewRepresentable: UIViewRepresentable {
    
    let color: UIColor
    
    init(color: UIColor) {
        self.color = color
    }
    
    func makeUIView(context: Context) -> JustUIView {
        let view = JustUIView()
        view.backgroundColor = color
        return view
    }
    
    func updateUIView(_ uiView: JustUIView, context: Context) {
        uiView.backgroundColor = color
    }
}
