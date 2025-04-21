//
//  ChartData.swift
//  UIViewInSwiftUI
//
//  Created by 신정욱 on 4/20/25.
//

struct ChartData: Identifiable, Equatable {
    let weakdayText: String
    let dailyStudied: Int
    
    var id: String { weakdayText }
}
