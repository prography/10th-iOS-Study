//
//  MapVC.swift
//  AppleLogin
//
//  Created by 신정욱 on 3/25/25.
//
// 네이버 지도 문서
// https://navermaps.github.io/ios-map-sdk/guide-ko/2-3.html

import UIKit

import NMapsMap
import SnapKit

final class MapVC: UIViewController {
    
    // MARK: Components
    
    private let mapView = {
        let mapView = NMFMapView()
        // 카메라 위치 이동
        let position = NMGLatLng(lat: 37.5044, lng: 127.0493) // 선릉역 인근
        let camera = NMFCameraPosition(position, zoom: 15)
        let update = NMFCameraUpdate(position: camera)
        mapView.moveCamera(update)
        
        // 마커 찍기
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.5044, lng: 127.0493) // 선릉역 인근
        marker.iconImage = NMF_MARKER_IMAGE_GRAY // 옵젝씨 전역상수인듯?
        marker.mapView = mapView
        // 마커를 지우려면 nil 할당, 실전에서는 별도의 컴포넌트로 관리해야 할 듯
        // marker.mapView = nil

        return mapView
    }()

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAutoLayout()
    }
    
    // MARK: Layout
    
    private func setAutoLayout() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints { $0.edges.equalTo(view.safeAreaLayoutGuide) }
    }
}

#Preview { MapVC() }
