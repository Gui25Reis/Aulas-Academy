/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 16/07/21 */

/* Bibliotecas necessárias: */
import UIKit


class CostumViews {
    
    /// Botão modelo usado em todo código
    static func newButton(with icon: Buttons) -> UIButton {
        let bt = UIButton(type: icon) 
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }
}
