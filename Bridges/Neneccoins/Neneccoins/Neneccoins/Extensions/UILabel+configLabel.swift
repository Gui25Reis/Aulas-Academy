//
//  UILabel+configFontInfo.swift
//  Neneccoins
//
//  Created by Gui Reis on 10/02/22.
//

import UIKit


extension UILabel {
    
    /// Configura a label de acrodo com as informações passadas pela controller pelo modal
    internal func configLabel(with config: FontInfo) -> Void {
        self.text = config.text
        self.font = .systemFont(ofSize: config.fontSize, weight: config.weight)
    }
}
