//
//  NewMeetingView.swift
//  TableView-Coredata
//
//  Created by Gui Reis on 19/01/22.
//

import UIKit

class NewMeetingView: UIView {
    
    /* MARK: - Atributos */
    
    public let addButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.backgroundColor = .systemTeal
        return bt
    }()
    
    
    
    /* MARK: -  */
    
    init() {
        super.init(frame:  .zero)
        
        self.backgroundColor = .systemIndigo
        
        self.addSubview(self.addButton)
        
        self.setContraints()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Constraints*/
    
    private func setContraints() -> Void {
        let size: CGFloat = 50
        
        // Label
        let buttonConstraints: [NSLayoutConstraint] = [
            self.addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.addButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.addButton.heightAnchor.constraint(equalToConstant: size),
            self.addButton.widthAnchor.constraint(equalToConstant: size),
        ]
        NSLayoutConstraint.activate(buttonConstraints)
    }

}
