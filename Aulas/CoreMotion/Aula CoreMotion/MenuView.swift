//
//  MenuView.swift
//  Aula CoreMotion
//
//  Created by Gui Reis on 25/08/21.
//

import UIKit

class MenuView: UIView {
    private var labels:[UILabel] = []
        
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemGray4
        
        for i in 0..<4 {
            self.labels.append(self.newLabel())
            self.addSubview(self.labels[i])
        }
        
        self.labels[3].textColor = .systemRed
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    /* MARK: - Encapsulamento */
    
    public func setTextLabels(list:[String]) -> Void {
        for i in 0..<3 {
            self.labels[i].text = list[i]
        }
    }
    
    public func setStatusLabel(text:String) -> Void { self.labels[3].text = text }

            
    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() {
        
        let heightBut: CGFloat = 0.05
        let widghtBut: CGFloat = 0.20
        let tabBut: CGFloat = 30
        
        // Y
        self.labels[0].centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.labels[0].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.labels[0].heightAnchor.constraint(equalToConstant: self.bounds.height * heightBut).isActive = true
        self.labels[0].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * widghtBut).isActive = true
        self.labels[0].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width * widghtBut).isActive = true
        
        
        // X
        self.labels[1].centerXAnchor.constraint(equalTo: self.labels[0].centerXAnchor).isActive = true
        self.labels[1].bottomAnchor.constraint(equalTo: self.labels[0].topAnchor, constant: -tabBut).isActive = true
        self.labels[1].heightAnchor.constraint(equalToConstant: self.bounds.height * heightBut).isActive = true
        self.labels[1].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * widghtBut).isActive = true
        self.labels[1].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width * widghtBut).isActive = true

        
        // Z
        self.labels[2].centerXAnchor.constraint(equalTo: self.labels[0].centerXAnchor).isActive = true
        self.labels[2].topAnchor.constraint(equalTo: self.labels[0].bottomAnchor, constant: tabBut).isActive = true
        self.labels[2].heightAnchor.constraint(equalToConstant: self.bounds.height * heightBut).isActive = true
        self.labels[2].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * widghtBut).isActive = true
        self.labels[2].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width * widghtBut).isActive = true
        
        
        // Status
        self.labels[3].centerXAnchor.constraint(equalTo: self.labels[0].centerXAnchor).isActive = true
        self.labels[3].bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
        self.labels[3].heightAnchor.constraint(equalToConstant: self.bounds.height * heightBut).isActive = true
        self.labels[3].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.bounds.width * widghtBut).isActive = true
        self.labels[3].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -self.bounds.width * widghtBut).isActive = true
    }
    
    /* MARK: - Criação */
    
    private func newLabel() -> UILabel {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        lb.textColor = .systemBackground
        lb.layer.cornerRadius = 7
        lb.textAlignment = .center
        
        lb.clipsToBounds = true
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }
}
