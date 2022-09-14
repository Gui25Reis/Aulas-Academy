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
    
    
    static func newSeg() -> UISegmentedControl {
        let itensSeg = ["A", "B", "C"]
        let seg = UISegmentedControl(items: itensSeg)
        seg.translatesAutoresizingMaskIntoConstraints = false
        
        
        seg.selectedSegmentTintColor = UIColor(.segBackSelected)
        seg.backgroundColor = UIColor(.segBackNotSelected)
        
        return seg
    }
 }
