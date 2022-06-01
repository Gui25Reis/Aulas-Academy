//
//  ViewController.swift
//  TrueDepth
//
//  Created by Paula Leite on 27/05/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var faceLabel: UILabel!
    
    var analysis = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelView.layer.cornerRadius = 10
        
        sceneView.delegate = self
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device.")
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARFaceTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        if let device = sceneView.device {
            let faceMeshGeometry = ARSCNFaceGeometry(device: device)
            let node = SCNNode(geometry: faceMeshGeometry)
            node.geometry?.firstMaterial?.fillMode = .lines
            
            return node
        } else {
            fatalError("No device found")
        }
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        if let faceAnchor = anchor as? ARFaceAnchor, let faceGeometry = node.geometry as? ARSCNFaceGeometry {
            faceGeometry.update(from: faceAnchor.geometry)
            
            expression(anchor: faceAnchor)
            DispatchQueue.main.async {
                self.faceLabel.text = self.analysis
            }
        }
    }
    
    
    func expression(anchor: ARFaceAnchor) {
        let cheekPuff = anchor.blendShapes[.cheekPuff]
        let tongue = anchor.blendShapes[.tongueOut]
        self.analysis = ""
        
        if let cheekPuffValue = cheekPuff?.decimalValue {
            if cheekPuffValue > 0.1 {
                self.analysis += "You're cheeks are puffed!"
            }
        }
        
        if let tongueValue = tongue?.decimalValue {
            if tongueValue > 0.1 {
                self.analysis += "Don't stick your tonge out!"
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}
