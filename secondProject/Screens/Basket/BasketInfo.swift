//
//  BasketInfo.swift
//  secondProject
//
//  Created by Руслан on 16.11.2023.
//

import UIKit

class BasketInfo: UITableViewCell {

    static var infoID = "BasketInfo"
    
    
    private lazy var infoVerticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        return stackView
    }()
    
    private lazy var bonusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange.withAlphaComponent(0.7)
        button.setTitle("Ввести промокод", for: .normal)
        button.layer.cornerRadius = 20
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(infoVerticalStackView)
        infoVerticalStackView.addArrangedSubview(bonusButton)
    }

    
    
}
