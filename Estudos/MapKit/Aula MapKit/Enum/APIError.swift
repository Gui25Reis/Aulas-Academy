//
//  APIError.swift
//  Aula MapKit
//
//  Created by Gui Reis on 16/12/21.
//

import struct Foundation.URLError


/**
    Classe responsável pelo tratamento dos erros que podem acontecer na API.
 
    Todos os erros são categorizados e tratados, podendo ter acesso á eles pelo que é mostrado ao usuário
 (`localizedDescription` ) ou para o desenvolvedor (`description`).
*/
enum APIError:Error, CustomStringConvertible {
    case badURL
    case badData
    case badDecode
    case badResponse(statusCode:Int)
    case url(URLError?)
    case mkLocalSearchError(Error)

    /// Feedback para o usuário
    var localizedDescription:String {
        switch self {
        case .badURL, .badDecode, .badData:
            return "Sorry, something went wrong."

        case .badResponse(_):
            return "Sorry, the connection to our server failed."

        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        
        case .mkLocalSearchError(_):
            return "Something went wrong."
        }
    }

    /// Feedback completo para desenvolver
    var description:String {
        switch self {
        case .badURL: return "URL inválida"
        case .badData: return "Erro nos dados recebidos"
        case .badDecode: return "Erro na hora de decodificar"

        case .url(let error):
            return error?.localizedDescription ?? "Eror na sessão com URL"

        case .badResponse(statusCode: let statusCode):
            return "Erro na chamada, status: \(statusCode)"
            
        case .mkLocalSearchError(let error):
            return "Erro na api MKLocalSearch: \(error.localizedDescription)"
        }
    }
}
