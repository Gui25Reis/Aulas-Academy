/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UITextField {
    
    /// Define uma única cor para os ícones
    /// - Parameter color: caso de uso da cor que vai ser usada nos ícones da search
    ///
    /// A  seleção de texto também vai ficar com essa cor.
    internal func setupIconsColor(with colorApp: AppColors) {
        let color = UIColor(colorApp)
        
        self.leftView?.tintColor = color
        self.rightView?.tintColor = color
        self.tintColor = color
        
        // Mudando a cor do botão "clear"
        if let clearButton = self.value(forKey: "_clearButton") as? UIButton {
            let imageButton = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
            clearButton.setImage(imageButton, for: .normal)
            clearButton.tintColor = color
        }
    }
}
