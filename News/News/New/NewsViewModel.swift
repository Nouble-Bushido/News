//
//  NewsViewModel.swift
//  News
//
//  Created by Артем Чжен on 15.08.2023.
//

import Foundation

protocol NewsViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var date: String { get }
    var imageData: Data? { get}
}

final class NewsViewModel: NewsViewModelProtocol {
    let title: String
    let description: String
    let date: String
    let imageData: Data?
    
    
    init(article: ArticleCellViewModel) {
        title = article.title
        description = article.descrioption
        date = article.date
        imageData = article.imageData
    }
}
