/* Macro - Grupo 05 */


/// Casos de cores usadas no projeto
enum AppColors: OriginalColor {
    
    /* MARK: - Casos */
    
    /* Textos */
    
    /// Sub títulos no geral
    case subTitle
    
        
    /* Telas */
    
    /// Telas: fundo padrão das telas
    case viewBack
    
        
    /* Search Bar */
    
    /// Search Bar: fundo da serch
    case searchBack
    
    /// Search Bar: textos
    case searchText
    
    /// Search Bar: ícones
    case searchIcons

    
    
    /* MARK: - Nome dos botões */
    
    /// Nome das cores
    var colorName: AppPureColors {
        switch self {
        case .subTitle: return .brownDark
            
        case .viewBack: return .white

        case .searchBack: return .greenLight
        case .searchText: return .greenDark
        case .searchIcons: return .greenDark
        }
    }
}
