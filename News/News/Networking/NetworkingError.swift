//
//  NetworkingError.swift
//  News
//
//  Created by Артем Чжен on 11.08.2023.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
