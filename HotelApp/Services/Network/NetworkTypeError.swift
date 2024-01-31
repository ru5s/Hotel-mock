//
//  NetworkTypeError.swift
//  HotelApp
//
//  Created by Ruslan Ismailov on 26/01/24.
//

import Foundation

enum NetworkTypeError {
    static let clientError = NSLocalizedString("clientError", comment: "")
    static let serverError = NSLocalizedString("serverError", comment: "")
    static let incorrectCode = NSLocalizedString("incorrectCode", comment: "")
    static let notAuthorizationRequest = NSLocalizedString("notAuthorizationRequest", comment: "")
    static let invalidUrl = NSLocalizedString("invalidUrl", comment: "")
    static let defaultError = NSLocalizedString("defaultError", comment: "")
    static let coudntGetData = NSLocalizedString("coudntGetData", comment: "")
}
