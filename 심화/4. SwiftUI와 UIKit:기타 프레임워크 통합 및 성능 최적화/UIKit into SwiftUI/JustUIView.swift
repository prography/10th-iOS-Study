//
//  JustUIView.swift
//  UIViewInSwiftUI
//
//  Created by 신정욱 on 4/20/25.
//

import UIKit

class JustUIView: UIView {
    
    // MARK: Properties
    
    let label = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.text = "UIKit의 UIView입니다."
        label.textColor = .white
        return label
    }()
    
    // MARK: Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    
    func setAutoLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}

#Preview { JustUIView() }
