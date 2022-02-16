//
//  MenuTableDelegate.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit


class MenuTableDelegate: NSObject, UITableViewDelegate {
    
    /* MARK: - Atributos */
    
    private var menuProtocol: MenuControllerDelegate!
            
        
    
    /* MARK: - Encapsulamento */
    
    public func setProtocol(_ delegate: MenuControllerDelegate) -> Void {
        self.menuProtocol = delegate
    }
    

        
    /* MARK: - Delegate */
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> Void {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadInputViews()
    }
    
    
    public func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        if indexPath.row != 2 {
            let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
                
                return self.menuProtocol.showCoinsOptions(at: indexPath.row)
            }
            return configuration
        }
        return UIContextMenuConfiguration()
    }
}
