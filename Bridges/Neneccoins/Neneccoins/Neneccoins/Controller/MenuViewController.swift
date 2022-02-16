//
//  ViewController.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit

class MenuViewController: UIViewController, MenuControllerDelegate {
    
    /* MARK: - Atributos */
    
    private let myView = MenuView()
    
    static var coins: [Coin] = []
    
    private var toCoin: Coin!
    
    private var fromCoin: Coin!
    
    
    // Delegates
    
    private let tableDelegate = MenuTableDelegate()
    
    private let tableDataSource = MenuTableDataSource()
    
    
    
    /* MARK: -  */
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.createCoinsDataBase()
        
        // Define como padrão a primeira e última moeda
        self.fromCoin = MenuViewController.coins[0]
        self.toCoin = MenuViewController.coins[MenuViewController.coins.count-1]
    }

    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}


    
    /* MARK: - Ciclo de Vida */
    
    public override func loadView() -> Void {
        super.loadView()
        
        self.view = self.myView
    }
    
    
    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        self.configureNavBar()
        
        self.myView.setTitle(text: FontInfo(text: "Your result is:", fontSize: 20, weight: .regular))
        self.myView.setResultLabel(text: FontInfo(text: "R$: 10,00", fontSize: 23, weight: .bold))
    }
    
    
    public override func viewWillAppear(_ animated: Bool) -> Void {
        super.viewWillAppear(animated)
        
        self.tableDelegate.setProtocol(self)
        self.tableDataSource.setProtocol(self)
        
        self.myView.setTableDelegate(self.tableDelegate)
        self.myView.setTableDataSource(self.tableDataSource)
    }
    
    
    /* MARK: - Delegate (Protocolo) */
    
    
    internal func showCoinsOptions(at ind: Int) -> UIMenu {
        var actions: [UIAction] = []
        
        for indCoin in 0..<MenuViewController.coins.count {
            let coin = MenuViewController.coins[indCoin]
            actions.append(
                UIAction(
                    title: coin.name,
                    image: UIImage(systemName: "bitcoinsign.circle")
                ) {_ in
                    if ind == 0 {
                        self.setFromCoin(ind: indCoin)
                    } else {
                        self.setToCoin(ind: indCoin)
                    }
                }
            )
        }
        
        let coinOptions = UIMenu(title: "", options: .displayInline,  children: actions)
        return coinOptions
    }
    
    
    internal func getConvertionValue(with value: String) -> Void {
        let num = self.isNumeric(at: value)
        if num != -1 {
            self.myView.setResultLabel(text: FontInfo(text: String(num), fontSize: 25, weight: .bold))
        }
    }
    
    
    @objc internal func invertAction() -> Void {
        self.dismiss(animated: true)
    }
    
    
    internal func getFromCoin() -> Coin {
        return self.fromCoin
    }
    
    internal func getToCoin() -> Coin {
        return self.toCoin
    }
    
    
    
    
    /* MARK: - Configurações */
        
    /// Configura a NavBar da classe
    private func configureNavBar() -> Void {
        self.title = ""
    }
    
    
    private func isNumeric(at str: String) -> Float {
        if let num = Float(str.replacingOccurrences(of: ",", with: ".")) {
            
            print("Aqui! Num ->  \(num)")
            return num
            
        }
        
        print("Aqui! Str -> \(str)")
        return -1
    }
    
    
    /// Cria a "base de dados" das moedas
    private func createCoinsDataBase() -> Void {
        let nameCoins: [String] = ["Rebeccoin", "Bahiaccoin", "Chevisccoin", "Nethccoin", "Carolccoin", "Real"]
        let initialsCoins: [String] = ["RBC", "BHC", "CVC", "NTC", "CLC", "R$"]
        let valuesCoins: [Float] = [12.45, 5.71, 9.14, 10.13, 10.45, 1]
        
        var allCoins:[Coin] = []
        
        for ind in 0..<nameCoins.count{
            allCoins.append(Coin(name: nameCoins[ind], initials: initialsCoins[ind], value: valuesCoins[ind]))
        }
        
        MenuViewController.coins = allCoins
    }
    
    
    private func setFromCoin(ind: Int) -> Void {
        self.fromCoin = MenuViewController.coins[ind]
        self.myView.updateTableData()
    }
    
    
    private func setToCoin(ind: Int) -> Void {
        self.toCoin = MenuViewController.coins[ind]
        self.myView.updateTableData()
    }
}

