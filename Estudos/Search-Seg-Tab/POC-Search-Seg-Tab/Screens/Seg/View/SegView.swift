/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// O que essa classe faz?
class SegView: UIView {
    
    /* MARK: - Atributos */

    // Views
    
    public let seg = CustomViews.newSeg()
    
    public let titleLabel = CustomViews.newLabel()
    
    public let nameCollection = CustomViews.newCollectionView()
    
    
    // Outros
    
    /// Constraints dinâmicas que mudam de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
        
        
    /// Configurações do layout da collection
    private let collectionFlow: UICollectionViewFlowLayout = {
        let cvFlow = UICollectionViewFlowLayout()
//        cvFlow.scrollDirection = .horizontal
             
        return cvFlow
    }()



    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        
        self.setupViews()
        self.registerCells()
        self.setupCollectionFlow()
        
        // self.configSegmentation()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */

    /// Vai atualizar a colllection quando tiver novos dados
    public func reloadCollection() {
        self.nameCollection.reloadData()
        self.nameCollection.reloadInputViews()
    }
    
    

    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() {
        super.layoutSubviews()
          
        self.setupUI()
        self.setupStaticTexts()
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */

    /* Collection */
    
    /// Registra as células nas collections/table
    private func registerCells() {
        self.nameCollection.register(NameCell.self, forCellWithReuseIdentifier: NameCell.identifier)
    }


    /// Define o layout da collection
    private func setupCollectionFlow() {
        self.nameCollection.collectionViewLayout = self.collectionFlow
    }

    
    /// Configura a segmentation
    private func configSegmentation() {
        self.seg.setTitle("A", forSegmentAt: 0)
        self.seg.setTitle("B", forSegmentAt: 1)
        self.seg.setTitle("C", forSegmentAt: 2)
    }

    
    
    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(self.seg)
        self.addSubview(self.titleLabel)
        self.addSubview(self.nameCollection)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.backgroundColor = UIColor(.viewBack)
        
        self.nameCollection.backgroundColor = UIColor(.viewBack)
        // self.nameCollection.layer.cornerRadius = 25
        
        self.collectionFlow.itemSize = CGSize(width: 110, height: 110)
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        self.titleLabel.setupText(with: FontInfo(
            text: "Alunos Academy", fontSize: 25, weight: .semibold
        ))
    }
      
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        let lateral: CGFloat = 15
        let between: CGFloat = 12
       
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
    
        self.dynamicConstraints = [
            self.seg.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.seg.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: lateral),
            self.seg.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -lateral),
            
            
            self.titleLabel.topAnchor.constraint(equalTo: self.seg.bottomAnchor, constant: between*2),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateral),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateral),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            
            self.nameCollection.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: between),
            self.nameCollection.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.nameCollection.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            self.nameCollection.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}
