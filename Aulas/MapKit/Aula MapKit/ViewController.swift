//
//  ViewController.swift
//  Aula MapKit
//
//  Created by Gui Reis on 24/08/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    private let mainView = MapView()
    
    private lazy var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.distanceFilter = 10
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = mainView
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    /* MARK: - Delegate */
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        if manager.authorizationStatus == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
}
