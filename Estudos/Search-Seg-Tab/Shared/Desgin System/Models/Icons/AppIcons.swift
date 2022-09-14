/* Macro - Grupo 05 */


/// Ícones usados no projeto
enum AppIcons: CustomStringConvertible {
    
    /* MARK: - Casos */
    
    /* Botões */
    
    /// Símbolo - 􀯶
    case back
    
    /// Símbolo - 􀊴
    case favorite
    
    /// Símbolo - 􀆈
    case showMore
    
    /// Símbolo - 􀆇
    case showLess
    
    
    
    /* Tab */
    
    /// Símbolo - 􀥳
    case gardenTab
    
    /// Símbolo - 􀸩
    case foodTab
    
    /// Símbolo - 􀊵
    case favoriteTab
    
    
    
    /* MARK: - Nome dos Botões */
    
    /// Nome dos botões (SF Symbols)
    var description: String {
        switch self {
        case .back: return "chevron.backward"
        case .favorite: return "heart"
        case .showMore: return "chevron.down"
        case .showLess: return "chevron.up"
            
        case .gardenTab: return "leaf.fill"
        case .foodTab: return "fork.knife"
        case .favoriteTab: return "heart.fill"
        }
    }
}
