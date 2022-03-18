/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 16/07/21 */


enum Buttons: CustomStringConvertible {
    case musicOn
    case musicOff
    case soundOn
    case soundOff
    case gameCenter
    
    var description: String {
        switch self {
        case .musicOn:    return "btMusicOn.png"
        case .musicOff:   return "btMusicOff.png"
        case .soundOn:    return "btSoundOn.png"
        case .soundOff:   return "btSoundOff.png"
        case .gameCenter: return "btGameCenter.png"
        }
    }
}
