//
//  ViewController.swift
//  CNContact
//
//  Created by Gui Reis on 23/12/21.
//

import UIKit
import Contacts
import ContactsUI


class ViewController: UIViewController, CNContactPickerDelegate {
    // View que vai ser usada
    private let mainView = MainView()
    
    // Guarda as pessoas que foram selecionadas
    private var peopleSelected: [String:PersonInfo] = [:]
    
    // Lista de contatos
    private let contactList = CNContactPickerViewController()
    
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        
        self.view = self.mainView
        
        // Definindo delegate
        self.contactList.delegate = self
        
        // Add açào do botão
        self.mainView.getButton().addTarget(self, action: #selector(self.buttonAction), for: .touchDown)
    }
    
    
    
    /* MARK: - Ações de Botões */
    
    @objc private func buttonAction() -> Void {
        self.present(self.contactList, animated: true)
    }
    
    
    
    /* MARK: - Delegate */
    
    // Seleciona um único usuário
//    public func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) -> Void {
//        self.showContactInfo(contact: contact)
//
//        let postalInfo: [CNLabeledValue<CNPostalAddress>] = contact.postalAddresses
//
//        // Verifica se tem informações nos campos de endereço
//        if postalInfo.count != 0 {
//            let infos = postalInfo[0].value
//
//            let name: String = "\(contact.givenName) \(contact.familyName)"
//
//            let personInfo = PersonInfo(
//                name: name,
//                pais: infos.isoCountryCode,
//                cidade: infos.city,
//                bairro: infos.subLocality,
//                rua: infos.street,
//                number: infos.subAdministrativeArea
//            )
//
//            self.peopleSelected.append(personInfo)
//        }
//    }
    
    /*
     Problemas encontrados:
     
     - A lista não eh a mesma dos contatos selecionados, some alguns nomes
     - Considerando uma lista pequena, não teria como o usuário selecionar todas as pessoas.
     
     */
    
    // Seleciona vários usuários
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        print("\n\nPessoas selecionadas da lista: \(contacts.count)\n\n")
        for contact in contacts {
            self.showContactInfo(contact: contact)

            let postalInfo: [CNLabeledValue<CNPostalAddress>] = contact.postalAddresses

            // Verifica se tem informações nos campos de endereço
            if postalInfo.count != 0 {
                let infos = postalInfo[0].value

                let name: String = "\(contact.givenName) \(contact.familyName)"
                
                let personInfo = PersonInfo(
                    name: name,
                    pais: infos.isoCountryCode,
                    cidade: infos.city,
                    bairro: infos.subLocality,
                    rua: infos.street
                )
                
                if !(self.peopleSelected.keys.contains(personInfo.name)) {
                    self.peopleSelected[name] = personInfo
                }
            }
        }
        
        print("\n\nPessoas selecionadas: \(self.peopleSelected.count)\n\n")
    }
    
    
    /* MARK: - Prints (DEBUG) */
    
    private func showContactInfo(contact: CNContact) -> Void {
        let postalInfo: [CNLabeledValue<CNPostalAddress>] = contact.postalAddresses
        
        print("\nNome: \(contact.givenName) \(contact.familyName)")
        
        // Verifica se tem informações nos campos de endereço
        if postalInfo.count != 0 {
            
            let infos = postalInfo[0].value
            
            print("Pais: \(infos.country)")
            print("Cidade: \(infos.city)")
            print("Bairro: \(infos.subLocality)")
            print("Rua: \(infos.street)\n")
                        
            
            // print("Tem endereço")
        } else {
            print("Não tem endereço\n")
        }

    }
    
}

