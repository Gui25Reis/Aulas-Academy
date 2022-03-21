/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 16/07/21 */

/* Bibliotecas necessárias: */
import UIKit


class ScreenOne: UIView {
    
    /* MARK: - Atributos */
    
    public lazy var musicButton = CostumViews.newButton(with: .musicOn)
    public lazy var soundButton = CostumViews.newButton(with: .soundOn)
    
    public lazy var otherButton = CostumViews.newButton(with: .gameCenter)
    
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemFill
        
        self.addSubview(self.musicButton)
        self.addSubview(self.soundButton)
        self.addSubview(self.otherButton)
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    /// Muda o icone do botão de música
    public func updateMusicButtonIcon(with icon: Buttons) -> Void {
        self.musicButton.setButtonImage(icon: icon)
    }
    
    /// Muda o icone do botão de som
    public func updateSoundButtonIcon(with icon: Buttons) -> Void {
        self.soundButton.setButtonImage(icon: icon)
    }

    /* As ações dos botões */
    
    public func setMusicAction(target: UIViewController, action: Selector) -> Void {
        self.musicButton.addTarget(target, action: action, for: .touchDown)
    }
    
    public func setSoundAction(target: UIViewController, action: Selector) -> Void {
        self.soundButton.addTarget(target, action: action, for: .touchDown)
    }
    
    public func setOtherAction(target: UIViewController, action: Selector) -> Void {
        self.otherButton.addTarget(target, action: action, for: .touchDown)
    }
    
    
    
    
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() -> Void {
        super.layoutSubviews()
        
        let size: CGFloat = 100
        let space: CGFloat = 70
        
        NSLayoutConstraint.activate([
            
            // Botão da música
            self.musicButton.heightAnchor.constraint(equalToConstant: size),
            self.musicButton.widthAnchor.constraint(equalToConstant: size),
            self.musicButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -space),
            self.musicButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -space),
            
            
            // Botão do som
            self.soundButton.heightAnchor.constraint(equalToConstant: size),
            self.soundButton.widthAnchor.constraint(equalToConstant: size),
            self.soundButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: space),
            self.soundButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -space),
            
            
            // Outro botão
            self.otherButton.heightAnchor.constraint(equalToConstant: size),
            self.otherButton.widthAnchor.constraint(equalToConstant: size),
            self.otherButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.otherButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: space)
        ])
    }
}
