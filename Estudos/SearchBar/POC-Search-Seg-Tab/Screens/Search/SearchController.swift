/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável POR
class SearchController: UIViewController, SearchControllerProtocol {
    
    /* MARK: - Atributos */

    /* View */

    /// View principal que a classe vai controlar
    private let myView = SearchView()
    
    
    /* Delegate & Data Sources */
    
    /// Delegate da Search Bar
    let searchDelegate = SearchDelegate()
    
    /// Data Source da collection de nomes
    let searchNameDataSource = NameCollectionDataSource()
    
    
    /* Dados */
    
    
    
    
		
    /* MARK: - Ciclo de Vida */
    
    override func loadView() {
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupDelegates()
        self.setupButtonsAction()
        self.setupKeyboardHandler()
        
        self.setCollectionData(for: MainController.allAcademyStudents)
    }
    


    /* MARK: - Protocolo */
    
    internal func updateCollection(for text: String) {
        let originalData: [String] = MainController.allAcademyStudents
        
        if text.isEmpty {
            self.setCollectionData(for: originalData)
            return
        }
        
        var filteredData: [String] = []
        
        
        for data in originalData {
            if data.lowercased() .contains(text.lowercased()) {
                filteredData.append(data)
            }
        }
        
        self.setCollectionData(for: filteredData)
    }
	

    /* MARK: - Ações de botões */
    
    /// Remove o teclado da tela
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Define os dados collection
    private func setCollectionData(for data: [String]) {
        self.searchNameDataSource.setCollectionData(for: data)
        self.myView.reloadCollection()
    }
    
    
    /// Definindo as ações dos botões
    private func setupButtonsAction() {
	  
    }
    
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
        self.myView.nameCollection.dataSource = self.searchNameDataSource
        
        self.searchDelegate.setProtocol(with: self)
        self.myView.search.delegate = self.searchDelegate
    }
    
    
    /// Lida com o teclado para tirar da tela
    private func setupKeyboardHandler() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
}
