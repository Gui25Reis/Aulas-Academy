/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UIFont {

    /// Configura a fonte considerando a famila que está sendo usada.
    /// - Parameter config: modelo de informações para configuração da fonte.
    /// - Returns: fonte configurada de acordo com o modelo passado.
    /// A familia da fonte está sendo definida global sendo arredondada
    static func setupFont(with config: FontInfo) -> UIFont {
        let systemFont: UIFont = .systemFont(ofSize: config.fontSize, weight: config.weight)
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: config.fontSize)
        }
        return systemFont
    }
}
