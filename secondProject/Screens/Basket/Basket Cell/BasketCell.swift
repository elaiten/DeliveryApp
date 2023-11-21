//
//  BasketCell.swift
//  secondProject
//
//  Created by Руслан on 25.10.2023.
//



// Ячейки который добавляют сами продукты описание, картинки
import UIKit

class BasketCell: UITableViewCell {
    
    var someNumber: Double = 1.0
    
    static let basketID = "BasketCell"
    
    private lazy var verticalStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        return stackView
    }()
    
    private lazy var basketImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "default")
        image.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        return image
    }()
    
    private lazy var nameProductLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var infoProductLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        
        return label
    }()
    
    private lazy var priceProductLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return view
        
    }()
    
    private lazy var basketStepper: UIStepper = {
        var stepper = UIStepper()
        stepper.value = Double(1)
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        return stepper
    }()
    
    
    @objc private func stepperValueChanged(_ sender: UIStepper){
        someNumber = sender.value
        print(someNumber)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK: - extension BasketCell

extension BasketCell {
    
    func update(_ product: Product) {
        basketImage.image = UIImage(named: product.image)
        nameProductLabel.text = product.name
        infoProductLabel.text = product.info
        let number = Double(product.price) * someNumber
        priceProductLabel.text = "\(NSString(format:"%.0f", number)) P"
        print(basketStepper.value)
        
    }
    
    
    func setupViews() {
        contentView.addSubview(basketImage)
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameProductLabel)
        verticalStackView.addArrangedSubview(infoProductLabel)
        verticalStackView.addArrangedSubview(priceProductLabel)
        contentView.addSubview(separatorView)
        contentView.addSubview(basketStepper)
    }
    
    func setupConstraints() {
        basketImage.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(16)
            make.left.equalTo(basketImage.snp.right).offset(16)
        }
        basketStepper.snp.makeConstraints { make in
            make.right.bottom.equalTo(contentView).inset(10)
        }
        separatorView.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(contentView)
        }
    }
}
