//
//  MenuTableDataSource.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit


class MenuTableDataSource: NSObject, UITableViewDataSource {
    
    /* MARK: - Atributos */
    
    private var menuProtocol: MenuControllerDelegate!
    
    private let inputDelegate = InputDelegate()
            
        
    
    /* MARK: - Encapsulamento */
    
    public func setProtocol(_ delegate: MenuControllerDelegate) -> Void {
        self.menuProtocol = delegate
        
        self.inputDelegate.setProtocol(delegate)
    }
    

        
    /* MARK: - Delegate */
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.identifier, for: indexPath) as? MenuTableCell else {
            return MenuTableCell()
        }
        
        switch indexPath.row {
            
        case 0:
            cell.setStyle(.justLabel)
            cell.setTitle(text: FontInfo(text: "From", fontSize: 18, weight: .semibold))
            cell.setCoinSelected(self.menuProtocol.getFromCoin())
            
        case 1:
            cell.setStyle(.justLabel)
            cell.setTitle(text: FontInfo(text: "To", fontSize: 18, weight: .semibold))
            cell.setCoinSelected(self.menuProtocol.getToCoin())
            
        default:
            cell.setStyle(.completed)
            cell.setTitle(text: FontInfo(text: "Value", fontSize: 18, weight: .semibold))
            
            cell.setInputDelegate(self.inputDelegate)
            
            // cell.eraseButton.addTarget(self.menuProtocol, action: #selector(self.menuProtocol), for: .touchDown)
        }
        
        return cell
    }
    
    
    
    /* MARK: - Configurações */
    
    public func updateCoinSelected(at ind: Int) -> Void {
        
    }
}
