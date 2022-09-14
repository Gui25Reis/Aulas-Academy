/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import struct CoreGraphics.CGSize


/// Tipo com um tamanho contendo largura e altura
///
/// Os tipos que conformam com esse protocolo cria casos específicos que retornam
/// proporções de tamanho (largura x altura) para cada caso
protocol ScreenSize {
    
    var size: CGSize { get }
}
