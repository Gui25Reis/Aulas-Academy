/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit

public class CollectionGroup: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    /// Título da tela
    public let titleLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.textColor = UIColor(.subTitle)
        
        return lbl
    }()
    
    /// Collection relacionada ao título
    public let collection: UICollectionView = CustomViews.newCollectionView()
    
    
    // Outros
    
    /// Estilo do grupo, pondendo ter somente a collection (.justCollection) ou
    /// a collection com o título dela (.complete - padrão).
    public var style: CollectionGroupStyle = .complete {
        didSet {
            switch self.style {
            case .complete:
                self.titleLabel.isHidden = false
                
            case .justCollection:
                self.titleLabel.isHidden = true
            }
        }
    }
    
    
    /// Constraints dinâmicas que mudam de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
		


    /* MARK: - Construtor */
    
    init(style: CollectionGroupStyle = .complete) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    
        self.style = style
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    

    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() {
        super.layoutSubviews()
	      
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {    
        self.addSubview(self.titleLabel)
        self.addSubview(self.collection)
    }
    
    
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        let between: CGFloat = self.getEquivalent(12)
        
        let titleLabelHeight: CGFloat = self.getEquivalent(25)
        
        
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
        
        switch self.style {
        case .complete:
            self.dynamicConstraints = [
                self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
                self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.titleLabel.heightAnchor.constraint(equalToConstant: titleLabelHeight),
                
                self.collection.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: between),
                self.collection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.collection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.collection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
            ]
            
        case .justCollection:
            self.dynamicConstraints = [
                self.collection.topAnchor.constraint(equalTo: self.topAnchor),
                self.collection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                self.collection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.collection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ]
        }
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
