//
//  MapView.swift
//  Aula MapKit
//
//  Created by Gui Reis on 24/08/21.
//

//import UIKit
import MapKit

class MapView: UIView {
    private let mapView:MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let text:UITextField = {
        let tx = UITextField()
        tx.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        tx.textColor = .systemBackground
        tx.layer.cornerRadius = 5
        tx.translatesAutoresizingMaskIntoConstraints = false
        return tx
    }()
    
    private let button:UIButton = {
        let bt = UIButton()
        
        let configIcon = UIImage.SymbolConfiguration(pointSize: 17, weight: .bold, scale: .large)
        bt.setImage(UIImage(systemName: "location.fill", withConfiguration: configIcon), for: .normal)
        
        bt.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        bt.layer.cornerRadius = 5
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(self.mapView)
        self.addSubview(self.text)
        self.addSubview(self.button)
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    /* MARK: - Encapsulamento */

    public func getEntryText() -> UITextField { return self.text }
    public func getMap() -> MKMapView { return self.mapView }
    public func getButton() -> UIButton { return self.button }

            
    /* MARK: - Ciclo de Vida */
    
    public override func layoutSubviews() {
        
        self.mapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.mapView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.mapView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
        self.text.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.text.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
        self.text.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        self.text.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        self.text.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.button.topAnchor.constraint(equalTo: self.text.bottomAnchor, constant: 10).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.text.trailingAnchor).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
