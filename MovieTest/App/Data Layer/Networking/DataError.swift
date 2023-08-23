//
//  DataError.swift
//  MovieTest
//
//  Created by Moez bachagha on 23/8/2023.
//

import Foundation

enum DataError: Error {
    case networkingError(String)
    case invalidData

}
