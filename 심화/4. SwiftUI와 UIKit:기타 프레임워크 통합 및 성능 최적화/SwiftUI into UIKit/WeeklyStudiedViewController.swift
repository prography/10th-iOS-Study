//
//  WeeklyStudiedViewController.swift
//  UIViewInSwiftUI
//
//  Created by 신정욱 on 4/20/25.
//

import UIKit
import SwiftUI

class WeeklyStudiedViewController: UIViewController {

    // MARK: Components
    
    let mainVStack = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 15
        return sv
    }()
    
    let label = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.text = "주간 학습량"
        return label
    }()
    
    let chartView = UIHostingController(rootView: ChartView([
        .init(weakdayText: "일", dailyStudied: 5),
        .init(weakdayText: "월", dailyStudied: 2),
        .init(weakdayText: "화", dailyStudied: 7),
        .init(weakdayText: "수", dailyStudied: 3),
        .init(weakdayText: "목", dailyStudied: 1),
        .init(weakdayText: "금", dailyStudied: 10),
        .init(weakdayText: "토", dailyStudied: 6),
    ])) // SwiftUI 임포트
    
    let resetButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("초기화", for: .normal)
        return button
    }()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        setAutoLayout()
    }
    
    // MARK: Layout
    
    func setAutoLayout() {
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(label)
        mainVStack.addArrangedSubview(chartView.view)
        mainVStack.addArrangedSubview(resetButton)
        
        NSLayoutConstraint.activate([
            mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    // MARK: Methods
    
    @objc func handleButtonTap() {
        chartView.rootView = ChartView([
            .init(weakdayText: "일", dailyStudied: 0),
            .init(weakdayText: "월", dailyStudied: 0),
            .init(weakdayText: "화", dailyStudied: 0),
            .init(weakdayText: "수", dailyStudied: 0),
            .init(weakdayText: "목", dailyStudied: 0),
            .init(weakdayText: "금", dailyStudied: 0),
            .init(weakdayText: "토", dailyStudied: 0),
        ])
    }
}

#Preview { WeeklyStudiedViewController() }
