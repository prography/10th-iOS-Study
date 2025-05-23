//
//  ViewController.swift
//  ARKit Practice
//
//  Created by minsong kim on 5/23/25.
//

import UIKit
import RealityKit
import ARKit

// AR 세션 설정 및 델리게이트 처리 예제
class ARSessionViewController: UIViewController, ARSessionDelegate {
    // RealityKit의 ARView
    var arView: ARView!
    private var directionalLight: DirectionalLight?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupARView()
        setupLighting()
        startARSession()
        addBoxAnchor()
    }
    
    // ARView 세팅 및 델리게이트 연결
    private func setupARView() {
        arView = ARView(frame: view.bounds)
        view.addSubview(arView)
        arView.session.delegate = self
    }
    
    // ARSession 실행 (World Tracking, 평면 탐지, 환경 텍스처링 등)
    private func startARSession() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        //중력 + 나침반 방향까지 고려
        config.worldAlignment = .gravityAndHeading
        arView.session.run(config)
    }
    
    // MARK: - ARSessionDelegate
    
    private func setupLighting() {
        let light = DirectionalLight()
        light.light.intensity = 1_000
        light.light.color = .white
        light.transform.rotation = simd_quatf(angle: -.pi/4, axis: [1, 0, 0])
        
        // Anchor에 붙이고 씬에 추가
        let lightAnchor = AnchorEntity(world: [0, 0, 0])
        lightAnchor.addChild(light)
        arView.scene.addAnchor(lightAnchor)
        
        directionalLight = light   // ← 여기서 보관
    }
    
    // 매 프레임마다 호출되는 업데이트 콜백
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        if let estimate = frame.lightEstimate {
            // RealityKit 씬에 조명 강도 반영
            directionalLight?.light.intensity = Float(estimate.ambientIntensity)
        }
    }
    
    // 수평 평면 위에 파란 박스 앵커 추가
    private func addBoxAnchor() {
        let boxMesh = MeshResource.generateBox(size: 0.1)
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        let boxEntity = ModelEntity(mesh: boxMesh, materials: [material])
        
        // 수평 평면 감지 Anchor
//        let anchor = AnchorEntity(plane: .horizontal)
        let anchor = AnchorEntity(world: [0, 0, -0.3])
        anchor.addChild(boxEntity)
        arView.scene.addAnchor(anchor)
    }
}

