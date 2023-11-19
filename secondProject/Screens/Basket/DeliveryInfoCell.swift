//
//  DeliveryInfoCell.swift
//  secondProject
//
//  Created by Руслан on 19.11.2023.
//

import UIKit

class DeliveryInfoCell: UITableViewCell {
    
    
    static let deliveryInfoID = "DeliveryInfoCell"
    
    
    let deliveryInfo = ["7 товаров", "3 283 P", "Начислим додокоинов", "+164 D", "Доставка", "Бесплатно"]

    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        //stackView.alignment = .leading
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }()
    
    func createHorizontalStack() -> UIStackView  {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        //stackView.alignment = .leading
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return stackView
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func createLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        return label
    }

    func setupViews() {

        contentView.addSubview(verticalStack)
        
        var horizontalStack = createHorizontalStack()
        for (index, element) in deliveryInfo.enumerated() {
            
            let label = createLabel(element)
            
            if index % 2 == 0 { //0
                horizontalStack = createHorizontalStack()
                label.textAlignment = .left
            }
            horizontalStack.addArrangedSubview(label)
            
            if index % 2 != 0 { //1
                verticalStack.addArrangedSubview(horizontalStack)
                label.textAlignment = .right
            }
        }
    }
    
    func setupConstraints() {
        
        verticalStack.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView).inset(10)
        }
    
    }
    
}
