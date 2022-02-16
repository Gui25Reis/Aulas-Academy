//
//  MainView.swift
//  CNContact
//
//  Created by Gui Reis on 23/12/21.
//


import UIKit
import Foundation

class MainView: UIView {
    private let button:UIButton = {
        let bt = UIButton()
        
        let configIcon = UIImage.SymbolConfiguration(pointSize: 17, weight: .bold, scale: .large)
        bt.setImage(UIImage(systemName: "plus", withConfiguration: configIcon), for: .normal)
        
        bt.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        bt.layer.cornerRadius = 5
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(self.button)
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    /* MARK: - Encapsulamento */

    public func getButton() -> UIButton { return self.button }

            
    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() {
        self.button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
