/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit



class SearchDelegate: NSObject, UISearchBarDelegate {
    
    /* MARK: - Atributos */
    
    /// Comunicação entre o delegate com ...
    private weak var searchControllerProtocol: SearchControllerProtocol?
        

    
    /* MARK: - Encapsulamento */
    
    /**
        Define qual vai ser o protocolo do delegate
        - Parameter protocol: protocolo de comunicação
    */
    public func setProtocol(with searchProtocol: SearchControllerProtocol ) {
        self.searchControllerProtocol = searchProtocol
    }
    
    
    
    /* MARK: - Delegate */
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchControllerProtocol?.updateCollection(for: searchText)
    }
}
