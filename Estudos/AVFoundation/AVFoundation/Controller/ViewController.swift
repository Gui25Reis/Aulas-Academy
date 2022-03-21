/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 16/07/21 */

/* Bibliotecas necessárias: */
import UIKit


class ViewController: UIViewController {
    
    /* MARK: - Atributos */
    
    private lazy var myView = ScreenOne()
    
    
    
    /* MARK: - Ciclo de Vida */
        
    public override func loadView() -> Void {
        super.loadView()
        
        self.view = myView
    }
    
    
    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        // Add as ações dos botões
        self.myView.setMusicAction(target: self, action: #selector(self.musicAction))
        self.myView.setSoundAction(target: self, action: #selector(self.soundAction))
        self.myView.setOtherAction(target: self, action: #selector(self.otherAction))
    }
    
    
    public override func viewDidAppear(_ animated: Bool) -> Void {
        super.viewDidAppear(animated)
        
        // Verifica se é a primeira vez que está entranod no app
        if !UserDefaults.standard.bool(forKey: "firstTimeOpenApp") {
            AudioController.shared.toggleSound()
            AudioController.shared.toggleMusic()
            
            UserDefaults.standard.set(true, forKey: "firstTimeOpenApp")
        }
        
        
        // Verifica se os áudios já estavam inativos
        if !AudioController.shared.getUserDefaultsStatus(with: .sound) {
            self.myView.updateSoundButtonIcon(with: .soundOff)
        }
        
        if !AudioController.shared.getUserDefaultsStatus(with: .music) {
            self.myView.updateMusicButtonIcon(with: .musicOff)
        } else {
            AudioController.shared.soundManager(with: .backgroundMusic, soundAction: .play)
        }
    }
    
    
    
    /* MARK: - Ações dos Botões */
    
    /// Ação de quando clica no botão de música
    @objc private func musicAction() -> Void {
        AudioController.shared.toggleMusic()
        var bt: Buttons
        
        switch AudioController.shared.getUserDefaultsStatus(with: .music) {
            case true: bt = .musicOn
            case false: bt = .musicOff
        }
        
        AudioController.shared.soundManager(with: .button, soundAction: .play)
        self.myView.updateMusicButtonIcon(with: bt)
    }
    
    
    /// Ação de quando clica no botão de som
    @objc private func soundAction() -> Void {
        AudioController.shared.toggleSound()
        var bt: Buttons
        
        switch AudioController.shared.getUserDefaultsStatus(with: .sound) {
            case true: bt = .soundOn
            case false: bt = .soundOff
        }
        
        AudioController.shared.soundManager(with: .button, soundAction: .play)
        self.myView.updateSoundButtonIcon(with: bt)
    }
    
    
    /// Ação de quando clica no botão de som
    @objc private func otherAction() -> Void {
        AudioController.shared.soundManager(with: .button, soundAction: .play)
    }
}
