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

    
    
    /* Segmented */
    
    /// Segmented: fundo do item selecionado
    case segBackSelected
    
    /// Segmented: fundo do item não selecionado
    case segBackNotSelected
    
    /// Segmented: texto dos itens selecionadas
    case segTextSelected
    
    /// Segmented: texto dos itens não selecionadas
    case segTextNotSelected
    
 
    
    /* MARK: - Nome dos botões */
    
    /// Nome das cores
    var colorName: AppPureColors {
        switch self {
            
        /* Textos */

        case .subTitle: return .brownDark

        /* Telas */
        case .viewBack: return .white
        
        /* Segmented */
        case .segBackSelected: return .greenDark
        case .segBackNotSelected: return .greenLight
        case .segTextSelected: return .white
        case .segTextNotSelected: return .greenDark
        }
    }
}
