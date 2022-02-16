//
//  MenuView.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit


class MenuView: UIView {

    /* MARK: - Atributos */
    
    public let invertButton = UICustom.costumButtom()
    
    private let convertionTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.backgroundColor = .systemGray4
        
        table.isScrollEnabled = false
                
        table.clipsToBounds = true
        table.layer.masksToBounds = true
        table.layer.cornerRadius = 7
        
        table.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.identifier)
    
        table.rowHeight = 45
        
        // Tirando o espaço do topo
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        
        let view = UIView(frame: frame)
        table.tableHeaderView = view
        table.tableFooterView = view
        
        return table
    }()
    
    private let resultView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10
        
        // Sombra
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        
        
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let titleResultLabel = UICustom.costumLabel()
    
    private let resultLabel = UICustom.costumLabel()
    
    
    
    /* MARK: -  */
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemGray6
        
        //self.addSubview(self.invertButton)
        self.addSubview(self.convertionTable)
        self.addSubview(self.resultView)
        
        self.resultView.addSubview(self.titleResultLabel)
        self.resultView.addSubview(self.resultLabel)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    

    
    /* MARK: - Encapsulamento */
    
    public func setTitle(text: FontInfo) -> Void {
        self.titleResultLabel.configLabel(with: text)
    }
    
    
    public func setResultLabel(text: FontInfo) -> Void {
        self.resultLabel.configLabel(with: text)
    }
    
    
    public func setTableDelegate(_ delegate: MenuTableDelegate) -> Void {
        self.convertionTable.delegate = delegate
    }
    
    
    public func setTableDataSource(_ dataSource: MenuTableDataSource) -> Void {
        self.convertionTable.dataSource = dataSource
    }
    
    
    public func updateTableData() -> Void {
        self.convertionTable.reloadData()
    }
    
    
    
    /* MARK: - Ciclo de Vida (Constraints) */
    
    public override func layoutSubviews() -> Void {
        super.layoutSubviews()
        
        let safeArea: CGFloat = 70
        let lateralSpace:CGFloat = 15
        let betweenSpace: CGFloat = 20
        
        let viewSize: CGFloat = 200
        let cellHeight: CGFloat = 45
        
        
        let viewConstraints: [NSLayoutConstraint] = [
            
            self.convertionTable.topAnchor.constraint(equalTo: self.topAnchor, constant: safeArea),
            self.convertionTable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -lateralSpace),
            self.convertionTable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: lateralSpace),
            self.convertionTable.heightAnchor.constraint(equalToConstant: cellHeight*3),
            
            
            self.resultView.topAnchor.constraint(equalTo: self.convertionTable.bottomAnchor, constant: betweenSpace),
            self.resultView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.resultView.heightAnchor.constraint(equalToConstant: viewSize),
            self.resultLabel.widthAnchor.constraint(equalToConstant: viewSize),
            
            
            self.titleResultLabel.bottomAnchor.constraint(equalTo: self.resultView.centerYAnchor),
            self.titleResultLabel.centerXAnchor.constraint(equalTo: self.resultView.centerXAnchor),
            self.titleResultLabel.heightAnchor.constraint(equalToConstant: betweenSpace),
            self.titleResultLabel.trailingAnchor.constraint(equalTo: self.resultView.trailingAnchor),
            self.titleResultLabel.leadingAnchor.constraint(equalTo: self.resultView.leadingAnchor),
            
            
            self.resultLabel.topAnchor.constraint(equalTo: self.resultView.centerYAnchor),
            self.resultLabel.centerXAnchor.constraint(equalTo: self.resultView.centerXAnchor),
            self.resultLabel.heightAnchor.constraint(equalToConstant: betweenSpace),
            self.resultLabel.trailingAnchor.constraint(equalTo: self.resultView.trailingAnchor),
            self.resultLabel.leadingAnchor.constraint(equalTo: self.resultView.leadingAnchor),
        ]
        NSLayoutConstraint.activate(viewConstraints)
    }

}
