//
//  BackButtonImage.swift
//  secondProject
//
//  Created by Руслан on 23.10.2023.
//

import UIKit

class BackButtonImage: UITableViewCell {

    
    
    private let imageCell: UIStackView = {
        let stackView = UIStackView()

        let width = UIScreen.main.bounds.width
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 9, trailing: 10)
        stackView.applyShadow(cornerRadius: 25)
        stackView.backgroundColor = .white
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    
   private let backButton: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "back")
        image.isUserInteractionEnabled = true
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.07 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.07 * width).isActive = true
        return image
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(imageCell)
        imageCell.addArrangedSubview(backButton)
    }
    
    func setupConstraints() {
        
        imageCell.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(70)
            make.left.equalTo(contentView).inset(20)
        }
    }
}

extension UIStackView {
    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.6
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}



