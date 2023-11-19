//
//  BonusCell.swift
//  secondProject
//
//  Created by Руслан on 19.11.2023.
//

import UIKit

class BonusCell: UITableViewCell {
    var onButtonTapped: (() -> ())?
    static let bonusId = "BonusCell"
    
    var verticalStackBonus: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }()
    
    private lazy var bonusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange.withAlphaComponent(0.8)
        button.setTitle("Ввести промокод", for: .normal)
        button.layer.cornerRadius = 17
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button.setTitleColor(.white, for: .normal)
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        contentView.addSubview(verticalStackBonus)
        verticalStackBonus.addArrangedSubview(bonusButton)
    }
    func setupConstraints() {
        verticalStackBonus.snp.makeConstraints { make in
            make.top.bottom.right.left.equalTo(contentView).inset(10)
        }
    }
    @objc func buttonTapped() {
        onButtonTapped?()
    }
}
