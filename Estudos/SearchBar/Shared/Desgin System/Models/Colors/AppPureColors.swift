/* Macro - Grupo 05 */


/// Cores usadas no projeto
enum AppPureColors: CustomStringConvertible {
    
    /* MARK: Casos */
    
    case orange
    case greenDark
    case greenLight
    case brownDark
    case brownLight
    case greyButton
    case pinkButton
    case white
    case greyDark
    

    
    /* MARK: Nome das cores */
    
    /// Nome das cores salvas nos assets
    var description: String {
        switch self {
        case .orange: return "Orange_E1652B"
        case .greenDark: return "Green_68802C"
        case .greenLight: return "Green_CCD897"
        case .brownDark: return "Brown_3F1D0D"
        case .brownLight: return "Brown_843D1A"
        case .greyButton: return "Grey_A1A1A1"
        case .pinkButton: return "Pink_ED7070"
        case .white: return "White_FEFEFE"
        case .greyDark: return "Grey_6A6A6A"
        }
    }
}
