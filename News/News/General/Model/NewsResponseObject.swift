//
//  NewsResponseObject.swift
//  News
//
//  Created by Артем Чжен on 10.08.2023.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
