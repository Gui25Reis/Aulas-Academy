/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit
import MapKit


struct CustomViews {
    
    /// Cria uma nova label de acordo com a padronização do projeto
    static func newLabel() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.layer.masksToBounds = true
        
        lbl.backgroundColor = UIColor(.viewBack)
        lbl.textColor = UIColor(.subTitle)
        
        lbl.textAlignment = .left
        return lbl
    }
    
    
    /// Cria uma collection de acordo com a padronização do projeto
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = UIColor(.viewBack)
        
        return col
    }

    
    
    /// Cria uma search bar de acordo com a padronização do projeto
    static func newSearch() -> UISearchBar {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        
        // Cores
        let textColor = UIColor(.searchText)
        
        search.backgroundImage = UIImage()
        search.searchTextField.backgroundColor = UIColor(.searchBack)
        search.searchTextField.textColor = textColor
        search.searchTextField.setupPlaceHolder(text: "Buscar", color: textColor)
        search.searchTextField.setupIconsColor(with: .searchIcons)
        
        return search
    }
 }
