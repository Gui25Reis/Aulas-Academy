/* Macro - Grupo 05 */


/// Cores usadas no projeto
enum AppPureColors: CustomStringConvertible {
    
    /* MARK: Casos */
    
    case greenDark
    case greenLight
    case brownDark
    case white
    

    
    /* MARK: Nome das cores */
    
    /// Nome das cores salvas nos assets
    var description: String {
        switch self {
        case .greenDark: return "Green_68802C"
        case .greenLight: return "Green_CCD897"
        case .brownDark: return "Brown_3F1D0D"
        case .white: return "White_FEFEFE"
        }
    }
}
