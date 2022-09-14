/* Macro - Grupo 05 */


/// Casos de cores usadas no projeto
enum AppColors: OriginalColor {
    
    /* MARK: - Casos */
    
    /* Textos */
    
    /// Usada em títulos da página
    case title
    
    /// Sub títulos no geral
    case subTitle
    
    /// Parágrafos de textos
    case paragraph
    
    
    
    /* Telas */
    
    /// Telas: fundo padrão das telas
    case viewBack
    
    /// Tela de Hortas: fundo
    case gardenBack
    
    /// Tela de Alimentos: fundo
    case foodBack
    
    /// Tela de Favoritos: fundo
    case favoriteBack
    
    
    
    /* Segmented */
    
    /// Segmented: fundo do item selecionado
    case segBackSelected
    
    /// Segmented: fundo do item não selecionado
    case segBackNotSelected
    
    /// Segmented: texto dos itens selecionadas
    case segTextSelected
    
    /// Segmented: texto dos itens não selecionadas
    case segTextNotSelected
    
    
    
    /* Tab Bar */
    
    /// Tab Bar: item selecionado
    case tabSelected
    
    /// Tab Bar: item não selecionado
    case tabNotSelected
    
    
    
    /* Search Bar */
    
    /// Search Bar: fundo da serch
    case searchBack
    
    /// Search Bar: textos
    case searchText
    
    /// Search Bar: ícones
    case searchIcons
    
    
    
    /* Botões */
    
    /// Botão favorito: estado de quando está selecionado
    case favoriteSelected
    
    /// Botão favorito: estado de quando não está selecionado
    case favoriteNotSelected
    
    /// Botão: fundo padrão
    case backgroundButton
    
    
    
    /* MARK: - Nome dos botões */
    
    /// Nome das cores
    var colorName: AppPureColors {
        switch self {
            
        /* Textos */
        case .title: return .greenDark
        case .subTitle: return .brownDark
        case .paragraph: return .greyDark
            
        
        /* Telas */
        case .viewBack: return .white
        case .gardenBack: return .greenDark
        case .foodBack: return .brownLight
        case .favoriteBack: return .orange
            
        
        /* Segmented */
        case .segBackSelected: return .greenDark
        case .segBackNotSelected: return .greenLight
        case .segTextSelected: return .white
        case .segTextNotSelected: return .greenDark
            
            
        /* Tab */
        case .tabSelected: return .greenDark
        case .tabNotSelected: return .greenLight
            
        
        /* Search */
        case .searchBack: return .greenLight
        case .searchText: return .greenDark
        case .searchIcons: return .greenDark
                    
        /* Botões */
        case .favoriteSelected: return .pinkButton
        case .favoriteNotSelected: return .greyButton
        case .backgroundButton: return .greyButton
        }
    }
}
