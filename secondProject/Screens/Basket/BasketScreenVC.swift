//
//  BasketScreen.swift
//  secondProject
//
//  Created by Руслан on 24.10.2023.
//

import Foundation
import UIKit
import SnapKit

final class BasketScreenVC: UIViewController {
    
    let answer = BasketCell()
    let nameLabel = BasketStartLabel()
    let orderBurron = OrderButtonView()
    
    let productService = ProductsService.init()
    var products: [Product] = [] {
        didSet {
            basketTableView.reloadData()
        }
    }
    
    lazy var basketTableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(BasketCell.self, forCellReuseIdentifier: BasketCell.basketID)
        table.dataSource = self
        table.delegate = self
//        table.translatesAutoresizingMaskIntoConstraints = true
        table.allowsSelection = false
        table.separatorColor = .clear
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        fetchProduct()
        updateLabel()
        updateButton()
        print(answer.someNumber)
    }
    func fetchProduct() {
        products = productService.fetchProduct()
    }
 
    func updateLabel() {
        nameLabel.basketStartLabel.text = "\(products.count) товара за \((products.first?.price)!) P"
    }
    func updateButton() {
        orderBurron.orderButton.setTitle("Оформить заказ за \((products.first?.price)!)", for: .normal)
    }
}

extension BasketScreenVC {

    
    func setupViews() {
        view.addSubview(nameLabel)
        view.backgroundColor = .white
        basketTableView.rowHeight = 140
        view.addSubview(basketTableView)
        view.addSubview(orderBurron)
    }
    
    func setupConstraints() {
        basketTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        orderBurron.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }

    }
}

extension BasketScreenVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.basketID, for: indexPath) as! BasketCell
        let product = products[indexPath.row]
        cell.update(product)
        return cell
    }
    
}


