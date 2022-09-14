/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


class ContainerView: UIView {
    
    /* MARK: - Atributos */
    
    // Views
    
    /// Título da tela do container
    public let titleLabel: UILabel = {
        let lbl = CustomViews.newLabel()
        lbl.numberOfLines = 2
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = UIColor(.title)
        return lbl
    }()
    
    /// Espaço para colocar os elemento UI da tela
    public let contentView: UIView = {
        let view = CustomViews.newView()
        view.backgroundColor = UIColor(.viewBack)
        return view
    }()
    
    
    // Outros
    
    /// Constraints dinâmicas que mudam de acordo com o tamanho da tela
    private var dynamicConstraints: [NSLayoutConstraint] = []
	


    /* MARK: - Construtor */
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    public func setTitleText(with text: String) {
        self.titleLabel.text = text
    }
    
    

    /* MARK: - Ciclo de Vida */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // self.backgroundColor = .cyan
        // self.contentView.backgroundColor = .cyan
	      
        self.setupUI()
        self.setupStaticTexts()
        self.setupDynamicConstraints()
    }
    
    
    
    /* MARK: - Configurações */

    /// Adiciona os elementos (Views) na tela
    private func setupViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.contentView)
    }
    
    
    /// Personalização da UI
    private func setupUI() {
        self.backgroundColor = UIColor(.viewBack)
        self.layer.cornerRadius = self.getEquivalent(30)
    }
    
    
    /// Define os textos que são estáticos (os textos em si que vão sempre ser o mesmo)
    private func setupStaticTexts() {
        let titleSize: CGFloat =  self.getEquivalent(35)
        
        self.titleLabel.setupText(with: FontInfo(
            fontSize: titleSize, weight: .bold
        ))
    }
	  
    
    /// Define as constraints que dependem do tamanho da tela
    private func setupDynamicConstraints() {
        let lateral: CGFloat = self.getEquivalent(15)
        let between: CGFloat = self.getEquivalent(30)
        
        let titleLabelHeight = self.getEquivalent(75)
       
        NSLayoutConstraint.deactivate(self.dynamicConstraints)
    
        self.dynamicConstraints = [
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: between),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateral),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateral),
            self.titleLabel.heightAnchor.constraint(equalToConstant: titleLabelHeight),
            
            
            self.contentView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: lateral),
            self.contentView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(self.dynamicConstraints)
    }
}




let listaCoreData = ["Gui", "Gabi", "Ana"]



var searchTexto = "G"



// Função que vai ficar na controller
func filterData(with text: String) -> [String] {
    var dadosFiltrados: [String] = []

    for item in listaCoreData {
        if item.contains(text) {
            dadosFiltrados.append(item)
        }
    }
    
    return dadosFiltrados
}


// delegate da search -> controller: Chama a função filterData com o texto X
// controller -> datasource -> novosdadso -> atualiza




// controller -> criar instancia data source -> datasource.dados = todos -> atualizar a collection (reload Data)

/*
 
 Class datasource
 
 var data: [Strings] = []
 
 
 funcao de numberOfItemsInSection -> return self.data.count
 
 
 
 */

// dataSource





// Gui
// Gabi
// Ana


