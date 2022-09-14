/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável POR
class SegController: UIViewController {
    
    /* MARK: - Atributos */

    /* View */

    /// View principal que a classe vai controlar
    private let myView = SegView()
    
    
    /* Delegate & Data Sources */
    
    private let segNameDataSource = NameCollectionDataSource()

		
    /* MARK: - Ciclo de Vida */
    
    override func loadView() {
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigation()
        self.setupDelegates()
        self.setupButtonsAction()
        
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
    
    @objc func segAction(sender: UISegmentedControl) {
        let itensSeg = ["A", "B", "C"]
        
        let indexSelected = sender.selectedSegmentIndex
        
        self.updateCollection(for: itensSeg[indexSelected])
    }
    
    
    /* MARK: - Configurações */
    
    
    
    /// Define os dados collection
    private func setCollectionData(for data: [String]) {
        self.segNameDataSource.setCollectionData(for: data)
        
        
        self.segNameDataSource.collectionData = data
        self.myView.nameCollection.reloadData()
        
//        reloadCollection()
    }
    

    /// Configurções da navigation controller
    private func setupNavigation() {
    
    }

    
    /// Definindo as ações dos botões
    private func setupButtonsAction() {
        self.myView.seg.addTarget(self, action: #selector(self.segAction(sender:)), for: .valueChanged)
    }
    
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
        self.myView.nameCollection.dataSource = self.segNameDataSource
    }
}
