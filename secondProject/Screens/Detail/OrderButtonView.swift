//
//  OrderButtonView.swift
//  secondProject
//
//  Created by Руслан on 15.10.2023.
//

import UIKit

class OrderButtonView: UIView {

   
    var orderButton: UIButton = {
        let button = UIButton()
//        button.setTitle("345", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
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
        self.backgroundColor = .systemBackground
        self.addSubview(orderButton)
      
    }
    
    func setupConstraints() {
        orderButton.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(10)
            make.top.bottom.equalTo(self).inset(16)
        }
        
        
    }
    
    func update(_ product: Product?) {
        orderButton.setTitle("В корзину за \(product?.price ?? 0)", for: .normal)
    }
   

}
