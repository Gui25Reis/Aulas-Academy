/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UITextField {
    
    /// Define o texto e a cor (do texto) do place holder (texto de background)
    /// - Parameters:
    ///   - text: texto do place holder
    ///   - color: cor do texto do place holder
    ///
    /// A cor é do tipo optional, caso queira deixar a cor padrão não precisa passar esse parâmetro
    internal func setupPlaceHolder(text: String, color: UIColor? = nil) {
        if let color = color {
            self.attributedPlaceholder = NSAttributedString (
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor: color]
            )
        } else {
            self.placeholder = text
        }
    }
}
