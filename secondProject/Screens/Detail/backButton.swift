//
//  backButton.swift
//  secondProject
//
//  Created by Руслан on 23.10.2023.
//

import UIKit

class BackButton: UIView {
    
    var backButton: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "back")
        image.isUserInteractionEnabled = true
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.1 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.1 * width).isActive = true
        return image
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
        self.addSubview(backButton)
    }
    
    func setupConstraints(){
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self).inset(70)
            make.left.equalTo(self).inset(10)
        }
    }
    
}
