import UIKit

final class MainTabBarController: UITabBarController {
    // MARK: - Properties

    // MARK: Private

    private let currencyConverterVC = UINavigationController(rootViewController: CurrencyConverterTableViewController())
    private let allCurrencyesVC = UINavigationController(rootViewController: AllCurrencyesTableViewController())

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        sleep(1) // Delay for the startup s÷creen
        addSetups()
    }

    // MARK: - Setups

    // MARK: Private

    private func addSetups() {
        addVCToTabBar()
        addImageInTabBar()
        addTitleInTabBar()
    }

    private func addVCToTabBar() {
        setViewControllers([currencyConverterVC, allCurrencyesVC], animated: true)
    }

    private func addImageInTabBar() {
        currencyConverterVC.tabBarItem.image = UIImage(systemName: "banknote")
        allCurrencyesVC.tabBarItem.image = UIImage(systemName: "dollarsign.circle")
    }

    private func addTitleInTabBar() {
        currencyConverterVC.title = "Главная"
        allCurrencyesVC.title = "Валюта"
        tabBar.tintColor = .label
    }
}
