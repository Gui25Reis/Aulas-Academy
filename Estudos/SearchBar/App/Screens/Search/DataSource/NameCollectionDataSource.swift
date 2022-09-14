/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// O que essa classe faz?
class NameCollectionDataSource: NSObject, UICollectionViewDataSource {
        
    /* MARK: - Atributos */
    
    
    public var collectionData: [String] = []


    
    /* MARK: - Encapsulamento */

    /** 
        Define qual vai ser o protocolo do Data Source
        - Parameter protocol: protocolo de comunicação
    */
    public func setCollectionData(for data: [String]) {
        self.collectionData = data
    }
    
    
    
    /* MARK: - Data Source */
    
    /// Mostra quantas células vão ser mostradas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionData.count
    }
    
    
    /// Faz a configuração de cada célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NameCell.identifier, for: indexPath) as? NameCell else {
            return UICollectionViewCell()
        }
        
        let name = self.collectionData[indexPath.row]
        
        cell.setName(for: name)
        
        return cell
    }
}
