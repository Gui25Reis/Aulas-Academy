//
//  MainViewController.swift
//  Collection-CoreData
//
//  Created by Gui Reis on 13/01/22.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var mainView = MainView()
    
    private let sugestionTypes: [String] = ["Restaurante", "Bar", "Cafeteria", "Cinema", "Padaria", "Shopping", "Teatro"]
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func viewWillAppear(_ animated: Bool) -> Void {
        self.view = self.mainView
        
        self.mainView.collection.delegate = self
        self.mainView.collection.dataSource = self
    }
    
    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        self.mainView.setTitleCollection(text: "Sugestão", sizeFont: 30, w: .bold)
    }

    
    
    /* MARK: - Delegate (Collection) */
    
    /// Mostra quantas células vão ser mostradas
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sugestionTypes.count
    }
    
    
    /// Configura uma célula
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Cria uma variácel para mexer com uma célula que foi criada
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.setContentView(text: self.sugestionTypes[indexPath.row], sizeFont: 20, w: .medium)
        
        return cell
    }
    
    
    /// Ação de quando clica em uma célula
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(self.sugestionTypes[indexPath.row]) selecionado.")
    }
}

