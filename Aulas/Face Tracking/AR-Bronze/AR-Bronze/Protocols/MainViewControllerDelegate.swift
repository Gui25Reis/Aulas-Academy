/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 31/05/22 */


/// Protocolo para comunicação da View Controller com o delegate do ARKit
protocol MainViewControllerDelegate: AnyObject {
    func setTextLabel(with text: String) -> Void
}
