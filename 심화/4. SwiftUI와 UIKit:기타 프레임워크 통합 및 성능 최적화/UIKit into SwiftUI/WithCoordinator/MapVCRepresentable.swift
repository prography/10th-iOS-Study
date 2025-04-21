//
//  MapVCRepresentable.swift
//  AppleLogin
//
//  Created by 신정욱 on 4/20/25.
//

import UIKit
import SwiftUI

import NMapsMap

struct MapVCRepresentable: UIViewControllerRepresentable {
    
    @Binding var authStateText: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> MapVC {
        let vc = MapVC()
        NMFAuthManager.shared().delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MapVC, context: Context) {}
    
    class Coordinator: NSObject, NMFAuthManagerDelegate {
        var parent: MapVCRepresentable
        
        init(parent: MapVCRepresentable) {
            self.parent = parent
        }
        
        // 맵 인증 상태 디버깅용 델리게이트
        func authorized(_ state: NMFAuthState, error: (any Error)?) {
            switch state {
            case .unauthorized:
                parent.authStateText = "인증되지 않음"
                                
            case .authorizing:
                parent.authStateText = "인증 진행 중"
                                
            case .pending:
                parent.authStateText = "인증 대기 중"
                                
            case .authorized:
                parent.authStateText = "인증 완료"
                                
            @unknown default:
                break
            }
            
            if let error { print(error.localizedDescription) }
        }
    }
}
