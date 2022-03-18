/* Gui Reis     -    gui.sreis25@gmail.com     -    Created on 16/07/21 */


/// Tipos de áudios
enum AudiosList: CustomStringConvertible {
    case backgroundMusic
    case button
    case swipe
    case colision
    
    var description: String {
        switch self {
        case .backgroundMusic: return "Musica-Fundo.mp3"
        case .button: return "Som-Botao.mp3"
        case .swipe: return "Som-Swipe.mp3"
        case .colision: return "Som-Colisa.mp3"
        }
    }
}


/// Acões de um áudio
enum AudiosAction {
    case play
    case pause
}


/// Quantidade de reproduções
enum AudioReproduction: Int {
    case oneTime = 1
    case loop = -1
}


/// Tipos de áudio
enum AudioType: CustomStringConvertible {
    case sound
    case music
    
    /// Chave do UserDefaults
    var description: String {
        switch self {
        case .sound: return "sound"
        case .music: return "music"
        }
    }
}

