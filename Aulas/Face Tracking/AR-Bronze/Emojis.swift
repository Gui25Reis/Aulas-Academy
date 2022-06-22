/* Gui Reis & Gabi Namie     -    Created on 02/06/22 */

/// Possíveis emojis
enum Emojis: CustomStringConvertible, CaseIterable {
    case piscadinha
    case linguinha
    case beijinho
    case tristinho
    case contentizinho
    case surpresinho
    case boiolinha
    case dozinha
    case tediozinho
    case safadinho
    case chateadinho
    case enjoadinho

    var description: String {
        switch self {
        case .piscadinha: return "😉"
        case .linguinha: return "😛"
        case .beijinho: return "😙"
        case .tristinho: return "☹️"
        case .contentizinho: return "😃"
        case .surpresinho: return "😮"
        case .boiolinha: return "☺️"
        case .dozinha: return "🥺"
        case .tediozinho: return "🙄"
        case .safadinho: return "😏"
        case .chateadinho: return "🫤"
        case .enjoadinho: return "🤢"
        }
    }
}
