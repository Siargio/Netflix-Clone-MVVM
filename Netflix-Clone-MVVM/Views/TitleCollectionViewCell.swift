//
//  TitleCollectionViewCell.swift
//  Netflix-Clone-MVVM
//
//  Created by Sergio on 28.12.22.
//

import UIKit
import SDWebImage

final class TitleCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    
    static let identifier = "TitleCollectionViewCell"

    //MARK: - UIElements
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setups

    func setupHierarchy() {
        addSubview(posterImageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model)") else {
            return
        }

        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
