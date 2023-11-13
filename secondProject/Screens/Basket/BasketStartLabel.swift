//
//  BasketStartLabel.swift
//  secondProject
//
//  Created by Руслан on 29.10.2023.
//

import UIKit

class BasketStartLabel: UIView {

    let basketStartLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "sadsads"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .darkGray
        label.text = """
Минимальная сумма заказа на
доставку - 699 ₽
"""
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(basketStartLabel)
        self.addSubview(startInfoLabel)
      
    }
    
    func setupConstraints() {
        basketStartLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(15)
            make.top.equalTo(self).inset(13)
        }
        startInfoLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(15)
            make.top.equalTo(self).inset(40)
        }
        
        
    }
    

    
}
