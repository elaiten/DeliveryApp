//
//  DetailScreenVC.swift
//  secondProject
//
//  Created by Руслан on 15.10.2023.
//

import UIKit

class DetailScreenVC: UIViewController {
    
    //    var product: Product? = Product(name: "Гавайская", detail: "Горячая закуска с цыпленком, перчиком халапеньо, маринованными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке.", info: "190 г", price: 590, image: "hawaii")
    //
    //
    
    

    
    
    let productService = ProductsService.init()
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let orderButtonView = OrderButtonView()
    let backButton = BackButtonImage()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        
        table.backgroundColor = .white
        table.dataSource = self
        table.delegate = self
        table.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseId)
        table.register(InfoCell.self, forCellReuseIdentifier: InfoCell.reuseId)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorColor = UIColor.clear
        table.allowsSelection = false
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        setupViews()
        setupConstraints()
        fetchProduct()
        updateButton()
    }
    
    func fetchProduct() {
        products = productService.fetchProduct()
    }
}

extension DetailScreenVC {
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(orderButtonView)
        view.addSubview(backButton)
        
    }
    private func setupConstraints() {

        
        backButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).inset(7)
            make.top.equalTo(view.safeAreaInsets).inset(-17)

        }
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        orderButtonView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
            
        }
    }
    
    func updateButton() {
        orderButtonView.orderButton.setTitle("В корзину за \((products.first?.price)!)", for: .normal)
    }
    
}






extension DetailScreenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseId, for: indexPath) as! ImageCell
            
            //let image = product?.image
            imageCell.update(products.first)
            return imageCell
        case 1:
            
            let infoCell = tableView.dequeueReusableCell(withIdentifier: InfoCell.reuseId, for: indexPath) as! InfoCell
            infoCell.update(products.first)
            return infoCell
        default: break
        }
        return UITableViewCell()
    }
    
    
}

//спросить как уменьшить растояние между блоками
//спросить как подтягивать цену из структуры


