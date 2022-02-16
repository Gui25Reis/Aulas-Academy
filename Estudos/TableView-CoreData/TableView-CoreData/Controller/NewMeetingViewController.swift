//
//  NewMeetingViewController.swift
//  TableView-Coredata
//
//  Created by Gui Reis on 19/01/22.
//

import UIKit

class NewMeetingViewController: UIViewController {
    
    /* MARK: - Atributos */
    
    private let mainView = NewMeetingView()
    
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        self.view = self.mainView
        
        self.mainView.addButton.addTarget(self, action: #selector(self.buttonAction), for: .touchDown)

        // Do any additional setup after loading the view.
    }
    
    
    
    /* MARK: - Ações dos botões */
    
    @objc private func buttonAction() -> Void {
        
        let data = MeetingCreated(
            address: "Delfina Street",
            city: "SP",
            country: "BR",
            date: "01/02/22",
            district: "Vila Madalena",
            hour: "19:00",
            latitude: 0,
            longitude: 0,
            name: "Olivio Bar",
            number: "196",
            type: "Restaurante",
            meetingName: "Encontro Test",
            participants: []
        )
        
        try! CoreDataManeger.shared.newMeeting(data: data)
        
        self.dismiss(animated: true)
    }

}
