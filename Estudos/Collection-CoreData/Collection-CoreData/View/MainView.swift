//
//  MainView.swift
//  Collection-CoreData
//
//  Created by Gui Reis on 13/01/22.
//

import UIKit

class MainView: UIView {
    
    private var sugestionLabel: UILabel = {
        let lbl:UILabel = UILabel()
        lbl.textColor =  #colorLiteral(red: 0.9878974557, green: 0.9603099227, blue: 0.9356864095, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    public var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal                // Direção da rolagem (se é horizontal ou vertical)
        layout.itemSize = CGSize(width: 200, height: 230)   // Define o tamanho da célula
        layout.minimumLineSpacing = 20                      // Espaço entre as células
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        cv.backgroundColor = .systemGray5
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemGray5
        
        self.addSubview(self.sugestionLabel)
        self.addSubview(self.collection)
        
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    /* MARK: - Encapsulamento */
        
    public func setTitleCollection(text: String, sizeFont:CGFloat, w:UIFont.Weight) -> Void {
        self.sugestionLabel.text = text
        self.sugestionLabel.font = .systemFont(ofSize: sizeFont, weight: w)
    }

        
        
    /* MARK: - Constraints */
    
    private func setConstraints() -> Void {
        let lateralSpace: CGFloat = 22
        let betweenSpace: CGFloat = 10
        
        // Label
        let labelConstraints: [NSLayoutConstraint] = [
            self.sugestionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50+35),
            self.sugestionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateralSpace),
            self.sugestionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateralSpace),
            self.sugestionLabel.bottomAnchor.constraint(equalTo: self.collection.topAnchor, constant: -betweenSpace)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        
        
        
        // Collection
        let collectionConstraints: [NSLayoutConstraint] = [
            self.collection.topAnchor.constraint(equalTo: self.sugestionLabel.bottomAnchor, constant: betweenSpace),
            self.collection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateralSpace),
            self.collection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateralSpace),
            self.collection.heightAnchor.constraint(equalToConstant: 250)
        ]
        NSLayoutConstraint.activate(collectionConstraints)
    }
}
