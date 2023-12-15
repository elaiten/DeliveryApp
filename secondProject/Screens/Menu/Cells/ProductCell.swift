import UIKit
import SnapKit



final class ProductCell: UITableViewCell {
    
    static let reuseID = "ProductCell"
    
    var onPriceButttonTapped: (()->())?
    
    private var verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 12, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
        
    private var label: UILabel = {
        var label = UILabel()
        label.text = "Hawaii"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var detail: UILabel = {
        var detail = UILabel()
        detail.text = "Тесто, Цыпленок, моцарелла, томатный соус"
        detail.textColor = .darkGray
        detail.numberOfLines = 0
        detail.font = UIFont.boldSystemFont(ofSize: 15)
        return detail
    }()
    
    private var priceButton: UIButton = {
        var button = UIButton()
        button.setTitle("469", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.1)
        button.layer.cornerRadius = 20
        button.setTitleColor(.brown, for: .normal)
        
        button.addTarget(nil, action: #selector(priceButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func priceButtonTapped() {
        onPriceButttonTapped?()
//        let viewController = DetailScreenVC()
//        viewController.present(DetailScreenVC(), animated: true, completion: nil)
    }
    
     var productImages: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "default")
        image.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        image.heightAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
        image.widthAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
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
    
}

extension ProductCell {
    private func setupViews() {
        contentView.addSubview(productImages)
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(label)
        verticalStackView.addArrangedSubview(detail)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    private func setupConstraints() {
        productImages.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(16)
            make.left.equalTo(productImages.snp.right).offset(16)
        }
    }
    
    func update(_ product: Product) {
        label.text = product.name
        detail.text = product.detail
        priceButton.setTitle("\(product.price) р", for: .normal)
        productImages.image = UIImage(named: product.image)
    }
}
