/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UIButton {
    
    /// Configura a fonte e texto do botão a partir da configuração passada
    /// - Parameter config: Modelo de informações do texto e fonte
    internal func setupText(with config: FontInfo) {
        if let text = config.text {
            self.setTitle(text, for: .normal)
        }
        
        self.titleLabel?.font = UIFont.setupFont(with: config)
    }
}
