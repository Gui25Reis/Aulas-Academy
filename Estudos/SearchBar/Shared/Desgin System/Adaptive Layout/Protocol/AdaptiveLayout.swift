/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGFloat


/// Tipo com métodos para definir o layout adaptativo
///
/// Os tipos que conformam com esse protocolo faz com que o layout adaptativo
/// seja possível e simplificado.
protocol AdaptiveLayout {
    
    func getEquivalent(_ space: CGFloat, dimension: Dimension) -> CGFloat
    
    func getEquivalent(_ space: CGFloat, sizeProporsion: SizeInfo?, screenReference: SizeInfo?) -> CGFloat
    
    func getScreenSize(from screen: Screens) -> CGSize
    
    func getScreenDimension(for info: SizeInfo) -> CGFloat
}
