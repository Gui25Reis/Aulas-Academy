//
//  UICustom.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit


class UICustom: UIView {
    
    static func costumButtom() -> UIButton {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }
    
    
    static func costumLabel(align: NSTextAlignment = .center) -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = align
        return lbl
    }
}
