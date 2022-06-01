/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 31/05/22 */


import UIKit
import ARKit

class MainViewController: UIViewController, MainViewControllerDelegate, ARSCNViewDelegate {
    
    /* MARK: - Atributos */
    
    /// Dlelegate da view AR
    let viewDelegate = ARMainViewDelegate()
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func loadView() -> Void {
        super.loadView()
        
        let myView = MainView()
        self.view = myView
    }
    
    
    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        guard let view = self.view as? MainView else {
            return
        }
        
        self.viewDelegate.setProtocol(with: self)
        
        view.setViewDelegate(with: viewDelegate)
        
        
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device.")
        }
    }
    
    
    public override func viewWillAppear(_ animated: Bool) -> Void {
        super.viewWillAppear(animated)
        
        if let view = self.view as? MainView {
            
            // Configuração que a AR vai fazer
            let configuration = ARFaceTrackingConfiguration()
            
            view.runConfiguration(with: configuration)
        }
    }
    
    
    public override func viewWillDisappear(_ animated: Bool) -> Void {
        super.viewWillDisappear(animated)
        
        if let view = self.view as? MainView {
            view.pauseSession()
        }
    }
    
    
    
    /* MARK: - Protocol */
    
    internal func setTextLabel(with text: String) -> Void {
        if let view = self.view as? MainView {
            view.setText(with: text)
        }
    }
}
