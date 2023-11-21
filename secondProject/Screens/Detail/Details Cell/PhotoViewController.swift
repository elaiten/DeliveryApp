
// PhotoViewController for PhotoViewController

import SnapKit
import UIKit

class PhotoViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        let itemsCount: CGFloat = 3
        let padding: CGFloat = 20
        let paddingCount: CGFloat = itemsCount + 1
        
        let view = UICollectionViewFlowLayout()
        view.scrollDirection = .vertical
        view.minimumLineSpacing = 80
        view.minimumInteritemSpacing = padding
        
        let paddingSize = paddingCount * padding
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount
        view.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        view.itemSize = CGSize(width: cellSize, height: cellSize)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: view)
        collectionView.backgroundColor = .orange
        view.itemSize = CGSize.init(width: 100, height: 100)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: PhotoCollectionCell.reuseID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionCell.reuseID, for: indexPath) as! PhotoCollectionCell
        cell.backgroundColor = .yellow
        return cell
    }
    
    
}
