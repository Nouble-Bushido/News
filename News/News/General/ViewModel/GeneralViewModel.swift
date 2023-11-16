//
//  GeneralViewModel.swift
//  News
//
//  Created by Артем Чжен on 10.08.2023.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    var reloadCell: ((Int) -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    private var articles: [ArticleCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
            
        }
    }
    
    
    init() {
        loadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        return articles[row]
    }
    
    private func loadData() {
        ApiManager.getNews(from: .general, page: 1) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articles):
                self.articles = self.convertToCellViewModel(articles)
                self.loadImage()
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func loadImage() {
        for(index, article) in articles.enumerated() {
            if let url = article.imageUrl {
                ApiManager.getImageData(url: url) { [weak self] result in
                    
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            self?.articles[index].imageData = data
                            self?.reloadCell?(index)
                        case .failure(let error):
                            self?.showError?(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
    
    private func convertToCellViewModel(_ articles: [ArticleResponseObject]) -> [ArticleCellViewModel] {
        return articles.map { ArticleCellViewModel(article: $0) }
    }
    
    private func setupMockObkects() {
        articles = [
            ArticleCellViewModel(article: ArticleResponseObject(title: "first", description: "first object descr", urlToImage: "11111111", date: "12.12.21"))
        ]
    }
}
