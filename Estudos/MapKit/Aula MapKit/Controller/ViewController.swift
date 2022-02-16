//
//  ViewController.swift
//  Aula MapKit
//
//  Created by Gui Reis on 24/08/21.
//

import UIKit
import CoreLocation
import MapKit



class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    /* MARK: - Atributos */
    
    /// View da controller
    private let mainView = MapView()
    
    private var mapKitManeger: MapViewManeger!
    
    /// Tipos de lugares que queremos pra busca
    private let placesTypes: [MKPointOfInterestCategory] = [
        // Parques
        .amusementPark,
        .nationalPark,
        
        // Restaurantes
        .restaurant,
        .bakery,
        .cafe,
        .nightlife,
        
        // Teatro e cinema
        .theater,
        .movieTheater,
    ]
    
    /// Locais encontrados
    private var nerbyPlaces: [MapPlace] = []
    
    /// Lista com as pessoas
    private let personExample: [Person] = [
        Person(name: "Muza", address: "", image: 0,
            coordinate: CLLocationCoordinate2D(latitude: -23.495480, longitude: -46.868080)
        ),
        
        Person(name: "Feh", address: "", image: 1,
            coordinate: CLLocationCoordinate2D(latitude: -23.545580, longitude: -46.651860)
        ),
        
        Person(name: "Bia", address: "", image: 2,
            coordinate: CLLocationCoordinate2D(latitude: -23.523580, longitude: -46.774770)
        ),
        
        Person(name: "Leh", address: "", image: 3,
            coordinate: CLLocationCoordinate2D(latitude: -23.627600, longitude: -46.637000)
        ),
        
        Person(name: "Oliver", address: "", image: 4,
            coordinate: CLLocationCoordinate2D(latitude: -23.741880, longitude: -46.661870)
        ),
        
        Person(name: "Gui", address: "", image: 0,
            coordinate: CLLocationCoordinate2D(latitude: -23.713213, longitude: -46.536622)
        )
    ]
    
    /// Tamanho da área que vai ser desenhada pra fazer a busca
    private let radiusArea: CLLocationDistance = 2500
    
    /// Coordenaa do ponto médio achado
    private var midpoint: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    /// Palavras que vão ser buscadas na hora de pesquisar os lugares
    private let searchWords: [String] = ["bar", "restaurant", "pizza", "shopping", "club", "park", "night", "party", "boteco"]
        
    /// Pontos encotrados por um endereço como string
    private var coordFound: [CLLocationCoordinate2D] = []
    
    /// Pesoas que foram selecionadas
    private var peopleSelected: [String:Person] = [:]
    
    /// Lugares que foram selecionados
    private var placesSelected: [String:MapPlace] = [:]
    
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        self.view = self.mainView
        
        self.mapKitManeger = MapViewManeger(mapView: self.mainView.getMap(), delegate: self)
        
        // Define o delegate do mapa
        self.mainView.getMap().delegate = self
        
    
        // Add ação do botão
        self.mainView.getButton().addTarget(self, action: #selector(self.buttonAction), for: .touchDown)
        
        //Procura por um ou vários toques.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Remova o comentário da linha abaixo se desejar que o toque não interfira e cancele outras interações.
        //tap.cancelsTouchesInView = false

        self.view.addGestureRecognizer(tap)
    }
    
    
    
    /* MARK: - Ação dos botões */
    
    /// Ativa o único botão da tela
    @objc private func buttonAction() -> Void {
        
        if self.nerbyPlaces.isEmpty {
            // Pega o ponto central
            var midwayPoints: [CLLocationCoordinate2D] = []
            
            
            // Adiciona os pontos exemplos
            for person in self.personExample {
                // Calculo do ponto médio
                midwayPoints.append(person.coordinate)
                
                // Add a pessoa no mapa
                let pin = self.mapKitManeger.createPin(name: person.name, coordinate: person.coordinate, type: "PersonType")
                self.peopleSelected[person.name] = person
                self.mapKitManeger.addPointOnMap(pin: pin)
            }
            
            self.midpoint = self.mapKitManeger.midpointCalculate(coordinates: midwayPoints)
            
            // Adiciona o ponto central
            let midwayPin = self.mapKitManeger.createPin(name: "The Midway", coordinate: self.midpoint, type: "TheMidway")
            self.mapKitManeger.addPointOnMap(pin: midwayPin)
            
            // Cria um círculo
            self.mapKitManeger.addCircle(at: self.midpoint)
            
            // Define a região que vai ser focada no mapa: o ponto dentral
            self.mapKitManeger.setMapView(at: self.midpoint, radius: self.radiusArea)
        }
        
        // Faz a busca por locais a partir das palavras chaves.
        DispatchQueue.main.async {
            for someWord in self.searchWords {
                self.mapKitManeger.getNerbyPlaces(at: self.midpoint, mainWord: someWord, pointsFilter: self.placesTypes) {places in
                    switch places {
                    case .success(let placesFound):
                        print(placesFound)
                    case .failure(let error):
                        print("Deu um erro \(error.description)")
                    }
                }
            }
        }
    }
    
    
    /// Tira o teclado
    @objc func dismissKeyboard() {self.view.endEditing(true)}
    
    
    private func pinType(type: String) -> String {
        switch type {
        case "MKPOICategoryAmusementPark":  return PointsOfInterest.amusementPark.localizedDescription
        case "MKPOICategoryPark":           return PointsOfInterest.nationalPark.localizedDescription
        case "MKPOICategoryRestaurant":     return PointsOfInterest.restaurant.localizedDescription
        case "MKPOICategoryBakery":         return PointsOfInterest.bakery.localizedDescription
        case "MKPOICategoryTheater":        return PointsOfInterest.theater.localizedDescription
        case "MKPOICategoryMovietheater":   return PointsOfInterest.movieTheater.localizedDescription
        case "MKPOICategoryCafe":           return PointsOfInterest.cafe.localizedDescription
        case "MKPOICategoryNightlife":      return PointsOfInterest.nightlife.localizedDescription
        default: return ""
        }
    }
    
    
    
    /* MARK: - Delegate */
    
    /// Autorização pra usar o mapa
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            self.mapKitManeger.locationManager.startUpdatingLocation()
        }
    }
    
    /// Todos os desenhos são configurados nessa função delegate. (OBS: caso faça algum outro desenho precisa específica com o if comentado)
    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // if overlay is MKCircle {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.fillColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)
            circle.strokeColor = .red
            circle.lineWidth = 1.0
            return circle
        // }
        // return overlay
    }
    
    
    /// Personaliza um pin
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "costumannotation")
        
        if annotation.subtitle!!.contains("TheMidway") {
            annotationView.markerTintColor = UIColor(named: "TheMidway")
            // return self.createAnnotationView(annotation, imageName: "UserTheMidway.svg")
        }
        
        if self.peopleSelected.keys.contains(annotation.title!!) {
            let imgNumber = self.peopleSelected[annotation.title!!]?.image
            return self.mapKitManeger.createAnnotationView(annotation, imageName: "Perfil\(imgNumber!).svg")
        }
        
        return annotationView
    }
    
}

