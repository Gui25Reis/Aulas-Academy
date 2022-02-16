//
//  MainView.swift
//  TableView-Coredata
//
//  Created by Gui Reis on 18/01/22.
//

import UIKit

class MainView: UIView {
    
    private var meetingLabel: UILabel
    
    public let addButton: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        
        bt.backgroundColor = .systemTeal
        return bt
    }()
    
    public let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .systemGray
        table.translatesAutoresizingMaskIntoConstraints = false
        
        // table.backgroundColor = .red
        
        // Tamanho da célula
        table.rowHeight = 80
    
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        // Tirando o espaço do topo
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        table.tableHeaderView = UIView(frame: frame)
        
        return table
    }()
    
    
    
    init() {
        self.meetingLabel = MainView.newLabel()
        
        super.init(frame: .zero)
        
        self.backgroundColor = .systemGray5
        
        self.addSubview(self.addButton)
        self.addSubview(self.meetingLabel)
        self.addSubview(self.tableView)
                
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    /* MARK: - Encapsulamento */
        
    public func setTitleTableView(text: String, sizeFont:CGFloat, w:UIFont.Weight) -> Void {
        self.meetingLabel.text = text
        self.meetingLabel.font = .systemFont(ofSize: sizeFont, weight: w)
    }

        
        
    /* MARK: - Constraints */
    
    private func setConstraints() -> Void {
        let lateralSpace: CGFloat = 22
        let betweenSpace: CGFloat = 10
        
        // Botão
        let buttonConstraints: [NSLayoutConstraint] = [
            self.addButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            self.addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.addButton.heightAnchor.constraint(equalToConstant: lateralSpace),
            self.addButton.widthAnchor.constraint(equalToConstant: lateralSpace),
        ]
        NSLayoutConstraint.activate(buttonConstraints)
        
        
        // Label
        let labelConstraints: [NSLayoutConstraint] = [
            self.meetingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50+35),
            self.meetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateralSpace),
            self.meetingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateralSpace),
            self.meetingLabel.bottomAnchor.constraint(equalTo: self.tableView.topAnchor, constant: -betweenSpace)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        
        
        
        // Collection
        let collectionConstraints: [NSLayoutConstraint] = [
            self.tableView.topAnchor.constraint(equalTo: self.meetingLabel.bottomAnchor, constant: betweenSpace),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateralSpace),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateralSpace),
            self.tableView.heightAnchor.constraint(equalToConstant: 600)
        ]
        NSLayoutConstraint.activate(collectionConstraints)
    }

    
    
    /* MARK: - Criação */
    
    static func newLabel() -> UILabel {
        let lbl:UILabel = UILabel()
        lbl.textColor =  #colorLiteral(red: 0.9878974557, green: 0.9603099227, blue: 0.9356864095, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }
    
}
