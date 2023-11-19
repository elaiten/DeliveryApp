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
    let orderButtonView = OrderButtonView()
    
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
        table.register(BonusCell.self, forCellReuseIdentifier: BonusCell.bonusId)
        table.register(DeliveryInfoCell.self, forCellReuseIdentifier: DeliveryInfoCell.deliveryInfoID)
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
        
        observeEvents()
    }
    
    func observeEvents() {
        orderButtonView.onButtonTapped = {
            print(#function)
        }
    }
    func fetchProduct() {
        products = productService.fetchProduct()
    }
    
    func updateLabel() {
        nameLabel.basketStartLabel.text = "\(products.count) товара за \((products.first?.price)!) P"
    }
    func updateButton() {
        orderButtonView.orderButton.setTitle("Оформить заказ за \((products.first?.price)!)", for: .normal)
    }
}

extension BasketScreenVC {
    
    
    func setupViews() {
        view.addSubview(nameLabel)
        view.backgroundColor = .white
        //basketTableView.rowHeight = 140
        view.addSubview(basketTableView)
        view.addSubview(orderButtonView)
    }
    
    func setupConstraints() {
        basketTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(80)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        orderButtonView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension BasketScreenVC: UITableViewDataSource, UITableViewDelegate {
    //    Число с колличеством ячеек в TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    //    возвращаем 2 ячейки через switch case
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return products.count
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.basketID, for: indexPath) as! BasketCell
            let product = products[indexPath.row]
            cell.update(product)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: BonusCell.bonusId, for: indexPath) as! BonusCell
            cell.onButtonTapped = {
                print(#function)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryInfoCell.deliveryInfoID, for: indexPath) as! DeliveryInfoCell
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
}


