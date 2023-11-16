//
//  NewsViewController.swift
//  News
//
//  Created by Артем Чжен on 08.08.2023.
//

import UIKit
import SnapKit

final class NewsViewController: UIViewController {
    
    // MARK: - GUI Properties
    private lazy var scrollView: UIScrollView = {
       let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView = UIView()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        
        return imageView
    }()
    
    private lazy var titleLable: UILabel = {
        let title = UILabel()
        
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.numberOfLines = 0
        
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.numberOfLines = 0

        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        
        dateLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        return dateLabel
    }()
    
    // MARK: - Properties
    private let edgeInset = 10
    private let viewModel: NewsViewModelProtocol
    
    // MARK: - Life cycle
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLable)
        contentView.addSubview(descriptionLabel)
        view.addSubview(scrollView)
        view.backgroundColor = .white
        
        titleLable.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData,
           let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image")
        }
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.width.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.snp.width)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
        }
        
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(edgeInset)
            make.leading.trailing.equalToSuperview().inset(edgeInset)
            make.bottom.equalToSuperview().inset(edgeInset)
        }
    }
}
