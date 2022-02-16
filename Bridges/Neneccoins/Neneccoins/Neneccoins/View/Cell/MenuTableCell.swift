//
//  MenuTableCell.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit


class MenuTableCell: UITableViewCell {
    
    /* MARK: - Atributos */
    
    static let identifier: String = "IdMenuTableCell"
    
    
    private let titleLabel = UICustom.costumLabel(align: .right)
    
    private let coinLabel = UICustom.costumLabel(align: .left)
    
    private let inputData: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        txt.layer.cornerRadius = 7
        txt.layer.masksToBounds = false
        
        txt.backgroundColor = .systemGray2
        
        txt.keyboardType = .decimalPad
        return txt
    }()
    
    public let eraseButton = UICustom.costumButtom()
            
    
    private var style: MenuTableCellStyle = .justLabel
    
    
    
    /* MARK: -  */
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.coinLabel)
        self.contentView.addSubview(self.inputData)
        self.contentView.addSubview(self.eraseButton)
                
        self.inputData.isHidden = true
        self.eraseButton.isHidden = true
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    
    /* MARK: - Encapsulamento */
    
    /// Define apenas o título da label
    public func setTitle(text: FontInfo) -> Void {
        self.titleLabel.configLabel(with: text)
        self.coinLabel.configLabel(with: text)
        self.coinLabel.text = ""
        
        let configIcon = UIImage.SymbolConfiguration(pointSize: text.fontSize-5, weight: .semibold, scale: .large)
        self.eraseButton.setImage(UIImage(systemName: "xmark.circle.fill", withConfiguration: configIcon), for: .normal)
    }
    
    
    /// Define apenas o nome da moeda selecionada
    public func setCoinSelected(_ coin: Coin) -> Void {
        self.coinLabel.text = coin.name
    }
    
    
    /// Define o delegate da entrada de texto
    public func setInputDelegate(_ delegate: InputDelegate) -> Void {
        self.inputData.delegate = delegate
    }
    
    
    /// Define o estilo da célula (se tem apenas duas label ou se tem a entrada de texto)
    public func setStyle(_ style: MenuTableCellStyle) -> Void {
        if style != self.style {
            var bool = true

            if style == .completed {bool = false}
            
            self.inputData.isHidden = bool
            self.eraseButton.isHidden = bool
            
            self.coinLabel.isHidden = !bool

            self.style = style
        }
    }
    
    
    
    /* MARK: - Ciclo de Vida (Constraints) */
    
    public override func layoutSubviews() -> Void {
        super.layoutSubviews()
        
        let betweenSpace: CGFloat = 5
        
        
        let viewConstraints: [NSLayoutConstraint] = [
            
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: betweenSpace),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: betweenSpace),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: betweenSpace),
            self.titleLabel.widthAnchor.constraint(equalToConstant: 50),
            
            
            // Style: .justLabel
            
            self.coinLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: betweenSpace),
            self.coinLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: betweenSpace),
            self.coinLabel.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: betweenSpace*2),
            self.coinLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -betweenSpace),
            self.coinLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            
            // Style: .completed
            
            self.inputData.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: betweenSpace),
            self.inputData.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: betweenSpace),
            self.inputData.leftAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: betweenSpace*2),
            self.inputData.rightAnchor.constraint(equalTo: self.eraseButton.leftAnchor, constant: -betweenSpace/2),
            self.inputData.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
            self.eraseButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: betweenSpace),
            self.eraseButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: betweenSpace),
            self.eraseButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -betweenSpace/2),
            self.eraseButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.eraseButton.widthAnchor.constraint(equalToConstant: self.frame.height - (betweenSpace*2))
        ]
        NSLayoutConstraint.activate(viewConstraints)
    }
}
