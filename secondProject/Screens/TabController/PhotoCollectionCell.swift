
import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    static let reuseID = "PhotoCollectionCell"
    
    
    var photoImageView: UIImageView = {
       let image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.backgroundColor = .blue
        image.image = UIImage.init(named: "cucumber")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Маринованные огурчики"
        label.numberOfLines = 0
        label.textAlignment = .center
       return label
    }()
    
    
    var priceLabel: UILabel = {
       let label = UILabel()
        label.text = "79p"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
    }
    
    func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
    }
}
