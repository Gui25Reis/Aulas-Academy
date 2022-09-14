/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import struct CoreGraphics.CGSize


/// Modelo de informações do tamanho da tela e da dimensão para o layout adaptativo.
struct SizeInfo {
    
    /* MARK: - Atributos */
    
    /// Tamanho da tela (largura x altura)
    var screenSize: CGSize
    
    /// Dimensão de referência (largura ou altura)
    var dimension: Dimension
    
    /// Tipo de tela
    var screenType: Screens
    
    
    
    /* MARK: - Construtores */
    
    
    /// Cria um modelo a partir das informações passadas
    /// - Parameters:
    ///   - screenSize: largura e altura da tela
    ///   - dimension: dimensão de referencia
    init(screenSize: CGSize, dimension: Dimension) {
        self.screenSize = screenSize
        self.dimension = dimension
        self.screenType = .custom
    }
    
    
    /// Cria um modelo a partir das informações passadas
    /// - Parameters:
    ///   - screen: tipo de tela
    ///   - dimension: dimensão de referencia
    init(screen: Screens, dimension: Dimension) {
        self.screenSize = screen.size
        self.dimension = dimension
        self.screenType = screen
    }
}
