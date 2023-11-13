import UIKit

enum TabBarPage {
    case menu
    case detail
    case basket
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .menu
        case 1:
            self = .detail
        case 2:
            self = .basket
        default:
            return nil
        }
    }
    func getTitle() -> String {
        switch self {
        case .menu:
            return "Меню"
        case .detail:
            return "Информация"
        case .basket:
            return "Корзина"
        }
    }
    func makeOrder() -> Int {
        switch self {
        case .menu:
            return 0
        case .detail:
            return 1
        case .basket:
            return 2
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .menu:
            return UIImage(named: "menu")
        case .detail:
            return UIImage(named: "detail")
        case .basket:
            return UIImage(named: "basket")
        }
    }
    
    func iconSelected() -> UIImage? {
        switch self {
        case .menu:
            return UIImage(named: "menuSelected")
        case .detail:
            return UIImage(named: "detailSelected")
        case .basket:
            return UIImage(named: "basketSelected")
        }
    }
}

