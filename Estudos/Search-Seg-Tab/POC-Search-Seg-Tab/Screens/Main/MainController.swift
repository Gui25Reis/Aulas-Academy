/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Criando a tab bar
class MainController: UITabBarController {
    
    /* MARK: - Atributos */
    
    /// Controller da tela 01: Ver todas as hortas
    private let searchController = SearchController()
    
    /// Controller da tela 02: Ver todas os alimentos
    private let segController = SegController()
    
    
    /* DADOS */
    
    /// Nome de todos da Academy
    static let allAcademyStudents: [String] = [
        "Anna", "Bia", "Bianca", "Carol Ortega", "Carol Taus", "Claudinha", "Debora", "Felipe", "Fran", "Gabi", "Gabriel Bahia", "Gabriel Batista", "Gui Reis", "Pimenta", "Juh Santana", "Leh", "Luca", "Pera", "Marcus Chevis", "Marcus Vinicius", "Mari", "Muza", "Nathy", "Rafael", "Rebecca", "Talita", "Thallis", "Vitor GK",
    ]
    
    
    /*
     
     for student in allAcademyStudents {
     
     }
     

     
     
     */
    
    
    /* MARK: - Ciclo de Vida */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = "Testee"
        
        str.contains("ee")
        self.setupTab()
        self.setupTabBarItens()
        self.setupControllers()
    }
    
    
    
    /* MARK: - Configurações */
    
    /// Configura a Tab Bar
    private func setupTab() {
        self.tabBar.backgroundColor = UIColor(.viewBack)
        self.tabBar.tintColor = UIColor(.tabSelected)
        self.tabBar.unselectedItemTintColor = UIColor(.tabNotSelected)
    }
    
    
    /// Define as controllers que vão aparecer na Tab Bar
    private func setupControllers() {
        self.viewControllers = [
            self.searchController,
            self.segController,
        ]
    }
    
    
    /// Configura os ícones e títulos de cada item da tab bar
    private func setupTabBarItens() {
        self.searchController.setupTab(text: "Search", icon: .gardenTab)
        self.segController.setupTab(text: "Seg", icon: .foodTab)
    }
}
