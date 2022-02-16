//
//  InputDelegate.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit


class InputDelegate: NSObject, UITextFieldDelegate {
    
    /* MARK: - Atributos */
        
    private var menuProtocol: MenuControllerDelegate!
            
        
    
    /* MARK: - Encapsulamento */
    
    public func setProtocol(_ delegate: MenuControllerDelegate) -> Void {
        self.menuProtocol = delegate
    }
    

        
    /* MARK: - Delegate */
    
    /// Essa função faz com que a tecla return do teclado faça o app aceitar a entrada e o teclado abaixe
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.returnKeyType = .done
        textField.resignFirstResponder()
        
        self.menuProtocol.getConvertionValue(with: textField.text ?? "0")
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.menuProtocol.getConvertionValue(with: string)
        return true
    }
}
