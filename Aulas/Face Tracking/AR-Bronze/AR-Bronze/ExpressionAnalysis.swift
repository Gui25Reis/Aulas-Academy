//
//  ExpressionAnalysis.swift
//  Nano05-AR
//
//  Created by Gui Reis on 08/06/22.
//
import ARKit


class ExpressionAnalysis {
    
    /* MARK: - Atributos */
    
    /// Analise da expressão
    var analysis = ""
    
    
    
    /* MARK: - Métodos */
    
    
    /// Compara se a expressão é o emoji em si
    private func compareExpression(to emoji: Emojis, with anchor: ARFaceAnchor) -> Bool {
        
        let innerUp = self.getExpressionValue(with: .browInnerUp, for: anchor) > 0.1
        let cheekPuff = self.getExpressionValue(with: .cheekPuff, for: anchor) > 0.1
        
        // 😗
        let mouthPucker = self.getExpressionValue(with: .mouthPucker, for: anchor) > 0.3
        

        // 😛
        let tongueOut = self.getExpressionValue(with: .tongueOut, for: anchor) > 0.3

        // ☹️
        let frownLeft = self.getExpressionValue(with: .mouthFrownLeft, for: anchor) > 0.1
        let frownRight = self.getExpressionValue(with: .mouthFrownRight, for: anchor) > 0.1

         
        // 😃
        let smileLeft = self.getExpressionValue(with: .mouthSmileLeft, for: anchor) > 0.2
        let smileRight = self.getExpressionValue(with: .mouthSmileRight, for: anchor) > 0.2
        let jawOpen = self.getExpressionValue(with: .jawOpen, for: anchor) > 0.2

        
        // 😏
        let lookInLeft = self.getExpressionValue(with: .eyeLookInLeft, for: anchor) > 0.1
        let lookInRight = self.getExpressionValue(with: .eyeLookInRight, for: anchor) > 0.1
        
        
        // 😒
        if lookInLeft && lookInRight && frownLeft && frownRight {
            self.analysis += "rancorozinho"
        }
        
        
        // 😮   🤔
        let outerUpLeft = self.getExpressionValue(with: .browOuterUpLeft, for: anchor) > 0.1
        let outerUpRight = self.getExpressionValue(with: .browOuterUpRight, for: anchor) > 0.1

        if outerUpLeft && outerUpRight && frownLeft && frownRight && !innerUp {
            self.analysis += "pensandinho"
        }
        
        // ☺️
        let blinkRight = self.getExpressionValue(with: .eyeBlinkRight, for: anchor) > 0.1
        let blinkLeft = self.getExpressionValue(with: .eyeBlinkLeft, for: anchor) > 0.1
                
        // 🙄
        let lookUpLeft = self.getExpressionValue(with: .eyeLookUpLeft, for: anchor) > 0.1
        let lookUpRight = self.getExpressionValue(with: .eyeLookUpRight, for: anchor) > 0.1

        // 🥺   🤢
                
        switch emoji {
        case .piscadinha:
            return false
        case .linguinha:
            return tongueOut
        case .beijinho:
            return mouthPucker && !innerUp
        case .tristinho:
            return frownLeft && frownRight && !innerUp
        case .contentizinho:
            return smileLeft && smileRight && jawOpen && !tongueOut
        case .surpresinho:
            return self.getExpressionValue(with: .jawOpen, for: anchor) > 0.5
        case .boiolinha:
            return innerUp && blinkLeft && blinkRight && smileLeft && smileRight
        case .dozinha:
            return false
        case .tediozinho:
            return innerUp && lookUpLeft && lookUpRight
        case .safadinho:
            return smileRight && lookInLeft && lookInRight
        case .chateadinho:
            return innerUp && frownRight && frownLeft
        case .enjoadinho:
            return cheekPuff && innerUp && !mouthPucker
        }
        
        
    }
    
    
    /// Analisa uma determinada expressão
    public func getExpressionAnalysis(with anchor: ARFaceAnchor) -> Emojis? {
        for emoji in Emojis.allCases {
            if self.compareExpression(to: emoji, with: anchor) {
                return emoji
            }
        }
        return nil
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
