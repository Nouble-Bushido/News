//
//  DetailsCollectionViewCell.swift
//  News
//
//  Created by Артем Чжен on 10.08.2023.
//

import UIKit
import SnapKit

final class DetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - GUI Variables
  private lazy var imageView: UIImageView = {
        let view = UIImageView()
      
      view.image = UIImage(named: "image")
      view.contentMode = .scaleAspectFit
      view.layer.masksToBounds = true
      
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
          let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 2
        
          return label
      }()
    
    private lazy var descriptionLabel: UILabel = {
          let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 2
        
          return label
      }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func set(article: ArticleCellViewModel) {
        titleLabel.text = article.title
        descriptionLabel.text = article.descrioption
        
        if let data = article.imageData,
           let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image")
        }
    }
    
    // MARK: - Private methods
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(self.frame.height)
            make.top.leading.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
        }
    }
}
