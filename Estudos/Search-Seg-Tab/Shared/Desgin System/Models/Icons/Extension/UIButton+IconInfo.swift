/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UIButton {
    
    /// Configura o ícone do botão a partir da configuração passada
    /// - Parameter config: Modelo de informações do texto e fonte
    internal func setupIcon(with config: IconInfo) -> Void {
        
        let configIcon = UIImage.SymbolConfiguration(
            pointSize: config.size,
            weight: config.weight,
            scale: config.scale
        )
        
        let image = UIImage(systemName: config.icon.description, withConfiguration: configIcon)
        self.setImage(image, for: .normal)
        
        if let btColor = UIColor(.viewBack) {
            self.tintColor = btColor
        }
    }
}
