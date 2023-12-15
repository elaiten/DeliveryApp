//
//  ViewController.swift
//  secondProject
//
//  Created by Руслан on 15.09.2023.
//

import UIKit
import SnapKit

final class MenuScreenVC: UIViewController {
    
    let productService = ProductsService()
    var products: [Product] = [] {
        didSet {
            tabelView.reloadData()
        }
    }
    
    lazy var tabelView: UITableView = {
        let tabelView = UITableView.init()
        tabelView.backgroundColor = .white
        tabelView.dataSource = self
        tabelView.delegate = self
        tabelView.separatorColor = .clear
        tabelView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tabelView.allowsSelection = false
        return tabelView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        fetchProduct()
    }
    
    func fetchProduct() {
        products = productService.fetchProduct()
    }
    
}

extension MenuScreenVC {
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tabelView)
    }
        
    private func setupConstraints() {
        tabelView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MenuScreenVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.update(product)
        
        cell.onPriceButttonTapped = {
            print(#function)
        }
        
        
        return cell
    }
    
    
}
