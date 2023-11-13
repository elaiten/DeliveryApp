class ProductsService {
    private let products: [Product] = [
        Product(name: "Гавайская", detail: "Горячая закуска с цыпленком, перчиком халапеньо, маринованными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке.", info: "190 г", price: 590, image: "hawaii"),
        Product(name: "Маргарита", detail: "Тесто, Cыр, Колбаска", info: "232 г", price: 1230, image: "margarita"),
        Product(name: "Буженина", detail: "Тесто, Cыр, Перец, Томат, Лук", info: "980 г", price: 732, image: "hawaii"),
        Product(name: "4 Сыра", detail: "Тесто, Cыр, Буженина", info: "232 г", price: 980, image: "hawaii"),
        Product(name: "Пеперрони", detail: "Тесто, Cыр, Перец, Томат, Лук", info: "980 г", price: 232, image: "pepperoni"),
    ]
    
    func fetchProduct () -> [Product] {
        return products
    }
}
