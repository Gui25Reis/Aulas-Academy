/* Gui Reis & Gabi Namie     -    Created on 02/06/22 */

/// Possรญveis emojis
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
        case .piscadinha: return "๐"
        case .linguinha: return "๐"
        case .beijinho: return "๐"
        case .tristinho: return "โน๏ธ"
        case .contentizinho: return "๐"
        case .surpresinho: return "๐ฎ"
        case .boiolinha: return "โบ๏ธ"
        case .dozinha: return "๐ฅบ"
        case .tediozinho: return "๐"
        case .safadinho: return "๐"
        case .chateadinho: return "๐ซค"
        case .enjoadinho: return "๐คข"
        }
    }
}
