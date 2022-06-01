/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 31/05/22 */

import UIKit
import SceneKit
import ARKit


class MainView: UIView {
    
    /* MARK: - Atributos */
    
    /// View de AR principal
    private let mainView: ARSCNView = {
        let v = ARSCNView()
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    /// Fundo da área de resultado
    private let container: UIView = {
        let v = UIView()
        
        v.backgroundColor = .systemBackground
        v.layer.cornerRadius = 15
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    /// Resultado da análise
    private let label: UILabel = {
        let v = UILabel()
        
        v.textColor = .systemGray3
        v.textAlignment = .center
    
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    
    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(self.mainView)
        self.addSubview(self.container)
        self.addSubview(self.label)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    
    /* MARK: - Encapsulamento */
    
    /// Define o texto da label
    public func setText(with text: String) -> Void {
        self.label.text = text
    }
    
    /// Define o delegate da View AR
    public func setViewDelegate(with delegate: ARSCNViewDelegate) -> Void {
        self.mainView.delegate = delegate
    }
    
    /// Cria o tipo da configuraçào que a View AR vai fazer
    public func runConfiguration(with configuration: ARConfiguration) -> Void {
        self.mainView.session.run(configuration)
    }
    
    /// Pausa a sessão
    public func pauseSession() -> Void {
        self.mainView.session.pause()
    }
    
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() -> Void {
        super.layoutSubviews()
        
        let space: CGFloat = 25
        let height: CGFloat = 80
                
        NSLayoutConstraint.activate([
            
            // View AR
            self.mainView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.mainView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.mainView.rightAnchor.constraint(equalTo: self.rightAnchor),

            
            // Container
            self.container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -space),
            self.container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: space),
            self.container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -space),
            self.container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.container.heightAnchor.constraint(equalToConstant: height),
            
            
            // Label
            self.label.topAnchor.constraint(equalTo: self.container.topAnchor),
            self.label.bottomAnchor.constraint(equalTo: self.container.bottomAnchor),
            self.label.leftAnchor.constraint(equalTo: self.container.leftAnchor),
            self.label.rightAnchor.constraint(equalTo: self.container.rightAnchor)
        ])
    }
}
