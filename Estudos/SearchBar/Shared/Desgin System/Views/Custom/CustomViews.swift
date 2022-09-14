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
    
    
    /// Cria uma nova view de acordo com a padronização do projeto
    static func newView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    
    /// Cria uma collection de acordo com a padronização do projeto
    static func newCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = UIColor(.viewBack)
        
        return col
    }
    
    
    /// Cria um botão de acordo com a padronização do projeto
    static func newButton() -> UIButton {
        return CustomButton()
    }
    
    
    /// Cria uma imagem (view) de acordo com a padronização do projeto
    static func newImage() -> UIImageView {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        
        return imgV
    }
    
    
    /// Cria um mapa de acordo com a padronização do projeto
    static func newMap() -> MKMapView {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
    }
    
    
    /// Cria uma scrool view de acordo com a padronização do projeto
    static func newScrool() -> UIScrollView {
        let scrool = UIScrollView()
        scrool.translatesAutoresizingMaskIntoConstraints = false
        
        return scrool
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
    
    
    static func newSeg() -> UISegmentedControl {
        let itensSeg = ["A", "B", "C"]
        let seg = UISegmentedControl(items: itensSeg)
        seg.translatesAutoresizingMaskIntoConstraints = false
        
        
        seg.selectedSegmentTintColor = UIColor(.segBackSelected)
        seg.backgroundColor = UIColor(.segBackNotSelected)
        
        return seg
    }
 }
