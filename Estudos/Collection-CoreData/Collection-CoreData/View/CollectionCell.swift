//
//  CollectionCell.swift
//  Collection-CoreData
//
//  Created by Gui Reis on 13/01/22.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    // MARK: - Atributos
    
    static let identifier = "myId"
    
    private let image: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    private var label: UILabel = {
        let lbl:UILabel = UILabel()
        lbl.textColor =  #colorLiteral(red: 0.9878974557, green: 0.9603099227, blue: 0.9356864095, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    
    // MARK: -
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(self.image)
        self.addSubview(self.label)

        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    // MARK: - Encapsulamento
    
    public func setContentView(text: String, sizeFont:CGFloat, w:UIFont.Weight) -> Void {
        self.label.text = text
        self.label.font = .systemFont(ofSize: sizeFont, weight: w)
        
        self.image.image = UIImage(named: "\(text) Icon.png")
    }
    
    
    
    
    // MARK: - Constraints
    public func setConstraints() -> Void {
        
        // Image View
        let collectionConstraints: [NSLayoutConstraint] = [
            self.image.topAnchor.constraint(equalTo: self.topAnchor),
            self.image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.image.heightAnchor.constraint(equalToConstant: 200)
        ]
        NSLayoutConstraint.activate(collectionConstraints)
        
        
        // Label
        let labelConstraints: [NSLayoutConstraint] = [
            self.label.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 5),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    // MARK: - Configurações
    
    public override func prepareForReuse() -> Void {
        super.prepareForReuse()
        
        self.label.text = nil
        self.image.image = nil
    }
    
}
