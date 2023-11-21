//
//  DeliveryInfoCell.swift
//  secondProject
//
//  Created by Руслан on 19.11.2023.

//Добавляет ячейки с информацией о заказе 

import UIKit

class DeliveryInfoCell: UITableViewCell {
    
    
    static let deliveryInfoID = "DeliveryInfoCell"
    
    
    let deliveryInfo = ["7 товаров", "3 283 P", "Начислим додокоинов", "+164 D", "Доставка", "Бесплатно"]
    
    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    func createHorizontalStack() -> UIStackView  {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
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
        
// Цикл который добавляет эллементы массива в две ячейки, который выравниваются по левой и правой стороне
        for (index, element) in deliveryInfo.enumerated() {
            let label = createLabel(element)
            if index % 2 == 0 { //0
                horizontalStack = createHorizontalStack()
                label.textAlignment = .left
            } else {
                verticalStack.addArrangedSubview(horizontalStack)
                label.textAlignment = .right
            }
            horizontalStack.addArrangedSubview(label)
        }
    }
    
    func setupConstraints() {
        
        verticalStack.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView).inset(10)
        }
        
    }
    
}
