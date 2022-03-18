/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 16/07/21 */

/* Bibliotecas necessárias: */
import UIKit


extension UIButton {
    
    convenience init(type: Buttons) {
        self.init(frame: .zero)
        
        self.setButtonImage(icon: type)
    }
    
    
    /// Altera a imagem usada no botão
    internal func setButtonImage(icon: Buttons) -> Void {
        let image = UIImage(named: icon.description)
        self.setImage(image, for: .normal)
    }
}
