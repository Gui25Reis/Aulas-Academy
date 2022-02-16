//
//  TableViewDelegate.swift
//  TableView-Coredata
//
//  Created by Gui Reis on 19/01/22.
//

import UIKit

class TableViewDelegate: UITableViewDelegate {
    
    static var meetings: [Meetings] = []
    
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
}
