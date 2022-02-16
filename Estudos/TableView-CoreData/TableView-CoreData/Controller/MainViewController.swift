//
//  ViewController.swift
//  TableView-Coredata
//
//  Created by Gui Reis on 18/01/22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /* MARK: - Atributos */
    
    private let mainView = MainView()
    
    private var meetings: [Meetings] = []
    
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func loadView() -> Void {
        super.loadView()
        
        self.view = self.mainView
    }
    
    
    public override func viewWillAppear(_ animated: Bool) -> Void {
        super.viewWillAppear(animated)
        
        self.reloadDataTableView()
    }
    

    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .gray
        
        self.mainView.setTitleTableView(text: "Meus Encontros", sizeFont: 30, w: .bold)
        
        self.mainView.addButton.addTarget(self, action: #selector(self.buttonAction), for: .touchDown)
        
        
        // Delegate
        
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
    }
    
    
    
    /* MARK: - Delegate (Table) */

    /// Quantidade de células que vai ter na table
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meetings.count
    }
    
    
    /// Cria o conteúdo da célula
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cria uma variável para mexer com uma célula que foi criada
        guard let cell = self.mainView.tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let infos = MeetingCreatedCellInfo(
            title: LabelConfig(
                text: self.meetings[indexPath.row].meetingName ?? "Título",
                sizeFont: 20, weight: .bold
            ),
            date: LabelConfig(
                text: self.meetings[indexPath.row].date ?? "",
                sizeFont: 14, weight: .regular
            ),
            hour: self.meetings[indexPath.row].hour ?? "",
            participants: ["Gui", "Anna", "Leh", "Bia", "Muza"],
            participantsConfig: LabelConfig(text: "", sizeFont: 11, weight: .regular)
        )
        
        cell.setCellInfo(info: infos)
        
        return cell
    }
    
    
    
    /* MARK: - Ações dos botões */
    
    @objc private func buttonAction() -> Void {
        
        let vc = NewMeetingViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true)
    }
    
    
    
    /* MARK: - Configurações*/
    
    public func reloadDataTableView() -> Void {
        self.meetings = CoreDataManeger.shared.getMeetingsCreated()
        
        print("\nEncontros - \(self.meetings.count)n")
        
        self.mainView.tableView.reloadData()
    }
}

