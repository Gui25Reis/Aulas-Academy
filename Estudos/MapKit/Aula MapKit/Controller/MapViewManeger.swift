//
//  MapViewManeger.swift
//  Aula MapKit
//
//  Created by Gui Reis on 17/12/21.
//

import Foundation
import MapKit
import CoreLocation

class MapViewManeger {
    /* MARK: - Atributos */
    
    /// View da controller
    private var mapView: MKMapView!
    
    /// Locais encontrados
    private var nerbyPlaces: [MapPlace] = []
    
    /// Lidando com a localização
    public lazy var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.distanceFilter = 10
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    /// Pontos encotrados por um endereço como string
    private var coordFound: [CLLocationCoordinate2D] = []
    
    /// Pesoas que foram selecionadas
    private var peopleSelected: [String:Person] = [:]
    
    /// Lugares que foram selecionados
    private var placesSelected: [String:MapPlace] = [:]
    
    /// Tamanho da área que vai ser desenhada pra fazer a busca
    private let radiusArea: CLLocationDistance = 2500
    
    
    
    init(mapView: MKMapView, delegate: CLLocationManagerDelegate) {
        self.mapView = mapView
        
        // Delegate
        self.locationManager.delegate = delegate
        self.locationManager.requestWhenInUseAuthorization()
    }
        
    
    /// Cria um pin com uma imagem
    public func createAnnotationView(_ annotation: MKAnnotation, imageName: String) -> MKAnnotationView {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "costumannotation")
        // annotationView.canShowCallout = true
        annotationView.image =  UIImage(named: imageName) // self.resizeImage(imageName: imageName, newSize: CGSize(width: 30, height: 30))
        return annotationView
    }
    

    /* MARK: - Pins */
    
    /// Adicionar ponto no mapa
    public func addPointOnMap(pin: MKPointAnnotation) -> Void {
        self.mapView.addAnnotation(pin)
    }
    
    /// Cria um pin
    public func createPin(name: String, coordinate: CLLocationCoordinate2D, type: String) -> MKPointAnnotation {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = name
        pin.subtitle = type
        
        return pin
    }
    
    
    
    /* MARK: - Gerenciamento do Mapa */
    
    /// Define a região que o mapa vai mostrar
    public func setMapView(at place: CLLocationCoordinate2D, radius: CLLocationDistance) -> Void {
        // let radiusDistance = CLLocationDistance(exactly: radius)!
        let region = MKCoordinateRegion(center: place, latitudinalMeters: radius, longitudinalMeters: radius)
        
        self.mapView.setRegion(region, animated: true)
    }
        
    
    
    
    /* MARK: - Ponto Médio */
    
    /// Calculo do ponto médio entre os pontos
    public func midpointCalculate(coordinates: [CLLocationCoordinate2D]) -> CLLocationCoordinate2D {
        let coordsCount = Double(coordinates.count)
        
        guard coordsCount > 1 else {
            return coordinates.first ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }

        var x: Double = 0.0
        var y: Double = 0.0
        var z: CGFloat = 0.0

        for coordinate in coordinates {
            let lat: CGFloat = self.toRadian(angle: coordinate.latitude)
            let lon: CGFloat = self.toRadian(angle: coordinate.longitude)
            
            x += cos(lat) * cos(lon)
            y += cos(lat) * sin(lon)
            z += sin(lat)
        }
                
        x /= coordsCount
        y /= coordsCount
        z /= coordsCount

        let lon = atan2(y, x)
        let hyp = sqrt(x*x + y*y)
        let lat = atan2(z, hyp)

        return CLLocationCoordinate2D(latitude: self.toDegree(radian: lat), longitude: self.toDegree(radian: lon))
    }
    
    /* Degrees to Radian */
    private func toRadian(angle: CLLocationDegrees) -> CGFloat {
        return CGFloat(angle) / 180.0 * CGFloat(Double.pi)
    }

    /* Radians to Degrees */
    private func toDegree(radian: CGFloat) -> CLLocationDegrees {
        return CLLocationDegrees(radian * CGFloat(180.0 / Double.pi))
    }
    
    
    
    
    /* MARK: - Desenhar */
    
    /// Adiciona um cículo
    public func addCircle(at location: CLLocationCoordinate2D) -> Void {
        let circle = MKCircle(center: location, radius: self.radiusArea as CLLocationDistance)
        
        self.mapView.addOverlay(circle)
    }
    
    
    
    
    /* MARK: - Locais */
    
    /// Pega os lugares próximos a partir
    public func getNerbyPlaces(at location: CLLocationCoordinate2D, mainWord: String, pointsFilter: [MKPointOfInterestCategory],
                                _ completionHandler: @escaping (Result<[MapPlace], APIError>) -> Void) -> Void {
        
        // Cria a pesquisa:
        let request = MKLocalSearch.Request()
        
        request.naturalLanguageQuery = mainWord
        
        // Coloca os pontos que deseja
        request.pointOfInterestFilter = MKPointOfInterestFilter(including: pointsFilter)
        
        // Define a regiao da pesquisa (a mesma do mapa)
        request.region = MKCoordinateRegion(center: location, latitudinalMeters: 400, longitudinalMeters: 400)
                
        // Realiza a pesquisa
        let search = MKLocalSearch(request: request)
        
        var placesFound: [MapPlace] = []
        
        let group = DispatchGroup()
        group.enter()
        
        search.start() { response, error in
            defer {group.leave()}
            
            if let error = error {
                completionHandler(.failure(APIError.mkLocalSearchError(error)))
                return
            }
            
            guard let response = response else {
                completionHandler(.failure(APIError.badResponse(statusCode: 502)))
                return
            }
            
            print("Itens encontrados para \(mainWord): \(response.mapItems.count). \n\n")
            
            
            for item in response.mapItems {
                
                if let name = item.name, let coords = item.placemark.location, let type = item.pointOfInterestCategory {
                    // Cria a cordenada
                    let coords2d = CLLocationCoordinate2D(
                        latitude: coords.coordinate.latitude,
                        longitude: coords.coordinate.longitude
                    )
                                        
                    // Cria o pin
                    let pin = self.createPin(name: name, coordinate: coords2d, type: "")
                    
                    // Guarda as informações
                    let newItem: MapPlace = MapPlace(
                        name: name,
                        coordinates: coords2d,
                        pin: pin,
                        type: type.rawValue,
                        country: item.placemark.isoCountryCode ?? "",
                        city: item.placemark.administrativeArea ?? "",
                        district: item.placemark.subLocality ?? "",
                        address: item.placemark.thoroughfare ?? "",
                        number: item.placemark.subThoroughfare ?? "",
                        site: String(describing: item.url),
                        contact: item.phoneNumber ?? ""
                    )
                    
                    // Verifica se está dentor do raio E se já não foi adicionado.
                    if self.getDistance(from: location, to: coords2d) <= self.radiusArea+500 && !self.findPlace(place: newItem){
                                                
                        // Adiciona na lista
                        placesFound.append(newItem)
                        print("Adicionei um lugar")
                        
                        // Add no mapa
                        self.addPointOnMap(pin: pin)
                        
                        // self.showPlacesFoundInfo(info: item)
                    }
                }
            }
            print("\n\n Locais no mapa: \(placesFound.count) \n\n")
        }
        
        group.notify(queue: .main) {
            print("Finalizei")
            completionHandler(.success(placesFound))
        }
    }
    
    /// Calcula a distancia entre dois pontos em metros
    public func getDistance(from place1: CLLocationCoordinate2D, to place2: CLLocationCoordinate2D) -> Double {
        let place01 = CLLocation(latitude: place1.latitude, longitude: place1.longitude)
        let place02 = CLLocation(latitude: place2.latitude, longitude: place2.longitude)
        
        return place01.distance(from: place02)
    }
    
    /// Verifica se já foi achado esse lugar
    private func findPlace(place: MapPlace) -> Bool {
        for places in self.nerbyPlaces {
            if place.name == places.name {
                return true
            }
        }
        return false
    }
    
    
    /// Pega a cordenada a partir de um endereço
    private func getCoordsByAddress(address: String) -> Void {
        let geocoder: CLGeocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) {placemarks, error in
            
            // Lidando com o erro.
            if let _ = error {
                return
            }
            
            // Caso tenha algum resultado um resultado
            if (placemarks?.count ?? 0 > 0) {
                // Pega o primeiro resultado
                let topResult: CLPlacemark = (placemarks?[0])!
                let placemark: MKPlacemark = MKPlacemark(placemark: topResult)
                
                let point = CLLocationCoordinate2D(latitude: (placemark.location?.coordinate.latitude)!,
                                                   longitude: (placemark.location?.coordinate.longitude)!)
                self.coordFound.append(point)
                
                for c in self.coordFound{
                    let pin = self.createPin(name: "", coordinate: c, type: "")
                    self.addPointOnMap(pin: pin)
                }
            } else {
                print("Não foi achado nenhum endereço.")
            }
        }
    }
    
    
    
    /* MARK: - Prints (Debug) */
    
    /// Mostra as informações achadas dos lugares
    private func showPlacesFoundInfo(info: MKMapItem) -> Void {
        print("\n\nLugar: \(info.name ?? "None")")
        print("Site: \(String(describing: info.url))")
        print("Celular: \(info.phoneNumber ?? "None")")
        print("TipoRaw: \(info.pointOfInterestCategory?.rawValue ?? "None")\n")
        print("Pais: \(info.placemark.country ?? "None")")
        print("Pais-codigo: \(info.placemark.countryCode ?? "None")")
        print("Pais-iso: \(info.placemark.isoCountryCode ?? "None")")
        print("Postal-Code: \(info.placemark.postalCode ?? "None")")
        print("Areas de Interesse: \(info.placemark.areasOfInterest ?? ["None"])")
        print("Rua: \(info.placemark.thoroughfare ?? "None")")
        print("Num: \(info.placemark.subThoroughfare ?? "None")")
        print("Cidade: \(info.placemark.administrativeArea ?? "None")")
        print("Bairro: \(info.placemark.subLocality ?? "None")\n\n")
    }
}
