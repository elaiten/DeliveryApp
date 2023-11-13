//
//  InfoCell.swift
//  secondProject
//
//  Created by Руслан on 15.10.2023.
//

import UIKit

class InfoCell: UITableViewCell {

    static let reuseId = "InfoCell"
    
    var verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 15, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = false
        return stackView
    }()
    
    var nameLable: UILabel = {
        var label = UILabel()
        //label.text = "Острый Додстер"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    var infoLable: UILabel = {
       var label = UILabel()
        //label.text = "Горячая закуска с цыпленком, перчиком халапеньо, маринованными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var detailLable: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension InfoCell {
    func setupViews() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameLable)
        verticalStackView.addArrangedSubview(detailLable)
        verticalStackView.addArrangedSubview(infoLable)
        
    }
    
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView).inset(6)
        }
    }
    
    func update(_ product: Product?) {
        nameLable.text = product?.name ?? ""
        infoLable.text = product?.detail ?? ""
        detailLable.text = product?.info ?? ""

    }
}



