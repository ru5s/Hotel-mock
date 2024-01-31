//
//  NetworkError.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 26/01/24.
//
import Foundation

enum NetworkError: Error {
    case clientError
    case serverError
    case incorrectCode
    case notAuthorizationRequest
    case invalidUrl
    case defaultError
    
    var description: String {
        switch self {
        case .clientError:
            return NetworkTypeError.clientError
        case .serverError:
            return NetworkTypeError.serverError
        case .incorrectCode:
            return NetworkTypeError.incorrectCode
        case .notAuthorizationRequest:
            return NetworkTypeError.notAuthorizationRequest
        case .invalidUrl:
            return NetworkTypeError.invalidUrl
        case .defaultError:
            return NetworkTypeError.defaultError
        }
    }
    
    static func generateError(_ statusCode: Int?) -> NetworkError {
        
        guard let statusCode = statusCode else { return .defaultError }
        
        switch statusCode {
            
        case 400:
            return .incorrectCode
            
        case 401:
            return .notAuthorizationRequest
            
        case 402...499:
            return .clientError
            
        case 500...599:
            return .serverError
            
        default:
            return .defaultError
        }
        
    }
    
}

