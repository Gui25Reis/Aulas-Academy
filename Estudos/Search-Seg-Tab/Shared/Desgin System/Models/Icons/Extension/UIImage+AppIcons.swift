/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


extension UIImage {
    
    convenience init?(_ icon: AppIcons) {
        self.init(systemName: icon.description)
    }
}
