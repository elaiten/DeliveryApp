//
//  ImageCell.swift
//  secondProject
//
//  Created by Руслан on 15.10.2023.
//

import UIKit

class ImageCell: UITableViewCell {
    
    static let reuseId = "ImageCell"
    
    var productImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "default")
        image.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width - 50
        image.heightAnchor.constraint(equalToConstant: width).isActive = true
        image.widthAnchor.constraint(equalToConstant: width).isActive = true
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
        contentView.addSubview(productImageView)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView).inset(40)
        }
    }
    
    func update(_ product: Product?) {
        productImageView.image = UIImage.init(named: product?.image ?? "")
    }
}


