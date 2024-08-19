//
//  PassportInfo.swift
//
//
//  Created by Nikita Dobrov on 19/08/2024.
//

import Foundation
import MRZParser

/// A document scan result
public struct PassportInfo: Hashable {
    public enum Sex: String {
        case male, female, unspecified
    }

    public enum DocumentType: String {
        case passport, id, other
    }
    /// A document type. Can be a Passport, ID Card or Other. Other includes Visa and other types of documents.
    public let documentType: PassportInfo.DocumentType
    /// A document number
    public let documentNumber: String?
    /// A country code for the issuing country
    public let countryCode: String
    /// A nationality country code
    public let nationalityCountryCode: String
    /// A surname or multiple surnames as a single string
    public let surnames: String
    /// A given name or multiple names as a single string
    public let givenNames: String
    /// A date of birth
    public let birthdate: Date?
    /// A sex of the document holder
    public let sex: PassportInfo.Sex
    /// First optional field which usually represents a personal identification number
    public let identificationNumber: String?
    /// A date when the document expires
    public let expiryDate: Date?
}

extension PassportInfo {
    static func from(_ result: MRZResult) -> PassportInfo {
        PassportInfo(
            documentType: result.documentType.asType,
            documentNumber: result.documentNumber,
            countryCode: result.countryCode,
            nationalityCountryCode: result.nationalityCountryCode,
            surnames: result.surnames,
            givenNames: result.givenNames,
            birthdate: result.birthdate,
            sex: result.sex.asType,
            identificationNumber: result.optionalData,
            expiryDate: result.expiryDate
        )
    }
}

extension MRZResult.DocumentType {
    var asType: PassportInfo.DocumentType {
        switch self {
        case .visa:
            return PassportInfo.DocumentType.other
        case .passport:
            return PassportInfo.DocumentType.passport
        case .id:
            return PassportInfo.DocumentType.id
        case .undefined:
            return PassportInfo.DocumentType.other
        }
    }
}

extension MRZResult.Sex {
    var asType: PassportInfo.Sex {
        switch self {
        case .male:
            return PassportInfo.Sex.male
        case .female:
            return PassportInfo.Sex.female
        case .unspecified:
            return PassportInfo.Sex.unspecified
        }
    }
}
