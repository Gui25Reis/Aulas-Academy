/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UIView: AdaptiveLayout {
    
    /// Converte o valor constante para o layout adaptativo de acordo com a tela de referência
    /// - Parameters:
    ///   - space: Valor constante
    ///   - dimension: Dimensão de referência (width / height)
    /// - Returns: Valor do layout adaptativo
    internal func getEquivalent(_ space: CGFloat, dimension: Dimension = .width) -> CGFloat {
        return self.getEquivalent(space, sizeProporsion: SizeInfo(screen: .view, dimension: dimension))
    }
    
        
    /// Converte o valor constante para o layout adaptativo de acordo com a tela de referência
    /// - Parameters:
    ///   - space: Valor constante
    ///   - sizeProporsion:  Dimensões da tela que vai ser usada para fazer a multiplicação (tamanho igual a X% da tela)
    ///   - screenReference: Dimensões da tela de referência do valor constante
    /// - Returns: Valor do layout adaptativo
    internal func getEquivalent(_ space: CGFloat, sizeProporsion: SizeInfo? = nil, screenReference: SizeInfo? = nil) -> CGFloat {
        let reference: SizeInfo = {
            if let screenReference = screenReference {
                return screenReference
            }
            return SizeInfo(screen: .iPhone12, dimension: .width)
        }()
        
        let proportion: SizeInfo = {
            if let sizeProporsion = sizeProporsion {
                return sizeProporsion
            }
            return SizeInfo(screen: .view, dimension: .width)
        }()
        
        let screenValue: CGFloat = self.getScreenDimension(for: reference)
        let proportionValue: CGFloat = self.getScreenDimension(for: proportion)
        
        // self.bounds.height * 0.1
        return proportionValue * space/(screenValue)
    }
    
    
    /// Pega a proporção de uma tela
    /// - Parameter screen: Tipos da tela
    /// - Returns: Altura e largura da tela
    internal func getScreenSize(from screen: Screens) -> CGSize {
        return screen == .view ? self.bounds.size : screen.size
    }
    
    
    /// Pega o valor de uma das dimensões
    /// - Parameter info: Conjunto de informações sobre a proporção
    /// - Returns: Valor da dimensão de uma determinada proporção
    internal func getScreenDimension(for info: SizeInfo) -> CGFloat {
        let screenSize: CGSize = {
            switch info.screenType == .custom {
            case true: return info.screenSize
            case false: return self.getScreenSize(from: info.screenType)
            }
        }()
        
        switch info.dimension {
        case .width: return screenSize.width
        case .height: return screenSize.height
        }
    }
}
