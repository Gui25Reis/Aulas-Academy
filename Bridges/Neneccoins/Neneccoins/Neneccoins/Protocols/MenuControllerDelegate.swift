//
//  MenuControllerDelegate.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import class UIKit.UIMenu


protocol MenuControllerDelegate: AnyObject {
    func showCoinsOptions(at ind: Int) -> UIMenu
    func getConvertionValue(with value: String) -> Void
    func invertAction()
    func getFromCoin() -> Coin
    func getToCoin() -> Coin
}
