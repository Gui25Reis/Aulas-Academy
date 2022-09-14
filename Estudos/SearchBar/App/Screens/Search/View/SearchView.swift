/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// O que essa classe faz?
class SearchView: UIView {
    
    /* MARK: - Atributos */

    // Views
    
    public let search = CustomViews.newSearch()
    
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


    /* Geral */
    
    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(self.search)
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
            self.search.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.search.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.search.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            
            self.titleLabel.topAnchor.constraint(equalTo: self.search.bottomAnchor, constant: between*2),
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
