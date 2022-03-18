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
        self.myView.getMusicButton().addTarget(self, action: #selector(self.musicAction), for: .touchDown)
        self.myView.getSoundButton().addTarget(self, action: #selector(self.soundAction), for: .touchDown)
        self.myView.getOtherButton().addTarget(self, action: #selector(self.otherAction), for: .touchDown)
    }
    
    
    public override func viewDidAppear(_ animated: Bool) -> Void {
        super.viewDidAppear(animated)
        
        AudioController.shared.soundManager(with: .backgroundMusic, soundAction: .play)
    }
    
    
    
    /* MARK: - Ações dos Botões */
    
    /// Ação de quando clica no botão de música
    @objc private func musicAction() -> Void {
        var bt: Buttons
        
        switch AudioController.shared.toggleMusic() {
            case true:
                bt = .musicOn
                AudioController.shared.soundManager(with: .backgroundMusic, soundAction: .play)
            
            case false:
                bt = .musicOff
                AudioController.shared.soundManager(with: .backgroundMusic, soundAction: .pause)
        }
        
        self.playAudio(audio: .button, type: .sound)
        self.myView.getMusicButton().setButtonImage(icon: bt)
    }
    
    
    /// Ação de quando clica no botão de som
    @objc private func soundAction() -> Void {
        
        var bt: Buttons
        
        switch AudioController.shared.toggleSound() {
            case true: bt = .soundOn
            case false: bt = .soundOff
        }
        
        self.playAudio(audio: .button, type: .sound)
        self.myView.getSoundButton().setButtonImage(icon: bt)
    }
    
    
    /// Ação de quando clica no botão de som
    @objc private func otherAction() -> Void {
        self.playAudio(audio: .button, type: .sound)
    }
    
    
    
    /* MARK: - Outros */
    
    /// Toca o som quando necessário
    private func playAudio(audio: AudiosList, type: AudioType) {
        if AudioController.shared.getUserDefaultsStatus(with: type) {
            AudioController.shared.soundManager(with: audio, soundAction: .play)
        }
    }
}
