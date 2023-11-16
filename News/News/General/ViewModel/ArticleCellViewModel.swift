//
//  ArticleCellViewModel.swift
//  News
//
//  Created by Артем Чжен on 10.08.2023.
//

import Foundation

final class ArticleCellViewModel: TableCollectionViewItemsProtocol {
    let title: String
    let descrioption: String
    let date: String
    let imageUrl: String?
    var imageData: Data?
    
    init(article: ArticleResponseObject) {
        title = article.title
        descrioption = article.description
        date = article.date
        imageUrl = article.urlToImage
    }
}
