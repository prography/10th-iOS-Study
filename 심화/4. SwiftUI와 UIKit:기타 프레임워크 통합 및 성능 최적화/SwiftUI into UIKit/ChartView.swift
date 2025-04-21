//
//  ChartView.swift
//  UIViewInSwiftUI
//
//  Created by 신정욱 on 4/20/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    // MARK: Propertes
    
    let dataArr: [ChartData]
    
    // MARK: Initalizer
    
    init(_ dataArr: [ChartData] = []) {
        self.dataArr = dataArr
    }
    
    // MARK: View
    
    var body: some View {
        Chart(dataArr) {
            BarMark(
                x: .value("dailyStudied", $0.dailyStudied),
                y: .value("weakdayText", $0.weakdayText)
            )
        }
        .animation(.easeInOut, value: dataArr)
        .frame(height: 400)
    }
}



#Preview {
    ChartView([
        .init(weakdayText: "일", dailyStudied: 5),
        .init(weakdayText: "월", dailyStudied: 2),
        .init(weakdayText: "화", dailyStudied: 7),
        .init(weakdayText: "수", dailyStudied: 3),
        .init(weakdayText: "목", dailyStudied: 1),
        .init(weakdayText: "금", dailyStudied: 10),
        .init(weakdayText: "토", dailyStudied: 6),
    ])
}
