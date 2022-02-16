//
//  PointsOfInterest.swift
//  Aula MapKit
//
//  Created by Gui Reis on 16/12/21.
//

import Foundation


enum PointsOfInterest: CustomStringConvertible {
    case amusementPark
    case nationalPark

    // Restaurantes
    case restaurant
    case bakery
    case cafe
    case nightlife

    // Teatro e cinema
    case theater
    case movieTheater

    /// Icones
    var localizedDescription:String {
        switch self {
            case .amusementPark, .nationalPark: return "ParkSVG.svg"
            case .restaurant: return "RestaurantSVG.svg"
            case .bakery: return "BakerySVG.svg"
            case .theater, .movieTheater: return "TheaterSVG.svg"
            case .cafe: return "CoffeSVG.svg"
            case .nightlife: return "BarSVG.svg"
        }
    }

    /// MKPointOfInterest
    var description:String {
        switch self {
            case .amusementPark: return "MKPOICategoryAmusementPark"
            case .nationalPark: return "MKPOICategoryPark"
            case .restaurant: return "MKPOICategoryRestaurant"
            case .bakery: return "MKPOICategoryBakery"
            case .theater: return "MKPOICategoryTheater"
            case .movieTheater: return "MKPOICategoryMovietheater"
            case .cafe: return "MKPOICategoryCafe"
            case .nightlife: return "MKPOICategoryNightlife"
        }
    }
}




