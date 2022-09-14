/* Macro - Grupo 05 */


/// Tipo com uma cor padrão do projeto
///
/// Os tipos que conformam com esse protocolo cria casos específicos que retornam
/// um tipo de cor do app (`AppPureColors`)
protocol OriginalColor {
    
    /// Nome da cor que é usada no app
    var colorName: AppPureColors { get }
}
