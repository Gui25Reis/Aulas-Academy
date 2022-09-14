/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UIColor {
    
    /// Cria uma cor de acordo com os casos de uso das cores do projeto
    /// - Parameter appColor: caso de uso
    convenience init?(_ appColor: AppColors) {
        self.init(originalColor: appColor.colorName)
    }
    
    
    /// Cria uma cor de acordo com cores do projeto
    /// - Parameter originalColor: cor usada no projeto
    ///
    /// Atenção: verifique se não existe um caso de uso de cor específico para a cor que
    /// está sendo definida.
    /// Basta acrescentar o `.` que todas as opçòes vão aparecer.
    convenience init?(originalColor: AppPureColors) {
        self.init(named: originalColor.description)
    }
}

