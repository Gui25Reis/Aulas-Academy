/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 31/05/22 */


import ARKit


class ARMainViewDelegate: NSObject, ARSCNViewDelegate {
    
    /* MARK: - Atributos*/
    
    /// Analise da expressão
    private var analysis = ""
    
    /// Protocolo de comunicação com a View Controller
    private var mainControllerDelegate: MainViewControllerDelegate?
    
    
    
    /* MARK: - Encapsulamento */
    
    /// Define o protocolo com a  view controller
    public func setProtocol(with delegate: MainViewControllerDelegate) {
        self.mainControllerDelegate = delegate
    }
    
    
    
    /* MARK: - Delegate */
    
    /// Primeiro contato
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        if let device = renderer.device {
            let faceMeshGeometry = ARSCNFaceGeometry(device: device)
            let node = SCNNode(geometry: faceMeshGeometry)
            node.geometry?.firstMaterial?.fillMode = .lines
            
            return node
        } else {
            fatalError("No device found")
        }
    }
    
    
    /// O que acontece quando tem uma atualização na câmera
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        if
            let faceAnchor = anchor as? ARFaceAnchor,
            let faceGeometry = node.geometry as? ARSCNFaceGeometry {
            faceGeometry.update(from: faceAnchor.geometry)
            
            self.expressionAnalysis(with: faceAnchor)
            
            DispatchQueue.main.async {
                self.mainControllerDelegate?.setTextLabel(with: self.analysis)
            }
        }
    }
    
    
    /* MARK: - Outros */
    
    /// Analisa uma determinada expressão
    private func expressionAnalysis(with anchor: ARFaceAnchor) {
        self.analysis = ""
    
        let innerUp = self.getExpressionValue(with: .browInnerUp, for: anchor) > 0.1
        let cheekPuff = self.getExpressionValue(with: .cheekPuff, for: anchor) > 0.1
        
        let frownLeft = self.getExpressionValue(with: .mouthFrownLeft, for: anchor) > 0.1
        let frownRight = self.getExpressionValue(with: .mouthFrownRight, for: anchor) > 0.1
        
        let tongueOut = self.getExpressionValue(with: .tongueOut, for: anchor) > 0.2
        
        let eyeLeft = self.getExpressionValue(with: .browDownLeft, for: anchor) > 0.4
        let eyeRight = self.getExpressionValue(with: .browDownRight, for: anchor) > 0.4
        let eyeSquinLeft = self.getExpressionValue(with: .eyeSquintLeft, for: anchor) > 0.1
        let eyeSquinRight = self.getExpressionValue(with: .eyeSquintRight, for: anchor) > 0.1
        let brownLeft = self.getExpressionValue(with: .browOuterUpRight, for: anchor) > 0.1
        let lookDownLeft = self.getExpressionValue(with: .eyeLookDownLeft, for: anchor) > 0.4
        let lookDownRight = self.getExpressionValue(with: .eyeLookDownRight, for: anchor) > 0.4
        
        let smileLeft = self.getExpressionValue(with: .mouthSmileLeft, for: anchor) > 0.4
        let smileRight = self.getExpressionValue(with: .mouthSmileRight, for: anchor) > 0.4
        let mouthClose = self.getExpressionValue(with: .mouthClose, for: anchor) > 0.1
        let jawOpen = self.getExpressionValue(with: .jawOpen, for: anchor) > 0.1
        
        let blinkRight = self.getExpressionValue(with: .eyeBlinkRight, for: anchor) > 0.2
        let blinkLeft = self.getExpressionValue(with: .eyeBlinkLeft, for: anchor) > 0.2

        // 😃
        if smileLeft && smileRight && jawOpen && !tongueOut && !(eyeLeft && eyeRight) {
            self.analysis += "risadinha"
        }

        // 😛
        if tongueOut {
            self.analysis += "linguinha"
        }
        
        // 😗
        
        if mouthPucker && !jawOpen && !cheekPuff && !(eyeLeft && eyeRight){
            self.analysis += "beijinho"
        }
        
        // 😏
        let smileLeft2 = self.getExpressionValue(with: .mouthSmileLeft, for: anchor)
        if  {
            self.analysis += "safadinho"
        }
        

        // 😮
        if  {
            self.analysis += "assustadinho"
        }
        
        // ☺️
        if innerUp && blinkLeft && blinkRight && smileLeft && smileRight && !jawOpen && !(eyeLeft && eyeRight) {
            self.analysis += "sorrisinho"
        }
        
        // 🥺
        
        if innerUp && frownRight && frownLeft && !jawOpen && mouthPucker2 && !(eyeLeft && eyeRight) {
            self.analysis += "chateadinho"
        }
        
        
        // 😠
        if eyeLeft && eyeRight && self.getExpressionValue(with: .mouthPucker, for: anchor) > 0.2 && !tongueOut {
            self.analysis += "bravinho"
        }
        
        // 😈
        if eyeLeft && eyeRight && !tongueOut &&
            (innerUp && blinkLeft && blinkRight && smileLeft && smileRight && !jawOpen)
        {
            self.analysis += "diabinho"
        }
        
        // 🤫
        if lookDownLeft && lookDownRight && mouthClose {
            self.analysis += "segredinho"
        }
        
        
        // 🤨
        if mouthClose && brownLeft {
            self.analysis += "baguncadinho"
        }
        
        // 😑
        if eyeSquinLeft && eyeSquinRight && mouthClose {
            self.analysis += "dormindo"
        }
    }
    
    
    /// Pega o valor de uma determinada expressão
    private func getExpressionValue(with expression: ARFaceAnchor.BlendShapeLocation, for anchor: ARFaceAnchor) -> Decimal {
        let expression = anchor.blendShapes[expression]
        
        if let value = expression?.decimalValue {
            return value
        }
        return -1
    }
    
}
