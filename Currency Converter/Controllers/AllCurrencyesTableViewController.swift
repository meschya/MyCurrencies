import UIKit

final class AllCurrencyesTableViewController: UITableViewController {
    // MARK: - Properties

    // MARK: Private

    private let activityIndicator: UIActivityIndicatorView = .init(style: .large)
    private var currencyes: [Currency] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    weak var delegate: TransferCurrencyBetweenVCDelegate?

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSetups()
        fetchDataCurrency()
    }

    // MARK: - Networking

    private func fetchDataCurrency() {
        showActivityIndicator()
        APIManager.instance.getCurrencys(completion: { currencyes in
            self.currencyes = currencyes
            self.hideActivityIndicator()
        })
    }

    // MARK: - Setups

    // MARK: Private

    private func addSetups() {
        addTableViewSetups()
        addNavigationSetups()
    }

    private func addTableViewSetups() {
        tableView.backgroundColor = Colors.xDarkNavy
        tableView.register(InfoCurrencyTableViewCell.self,
                           forCellReuseIdentifier: InfoCurrencyTableViewCell.identifier)
        tableView.separatorStyle = .none
    }

    private func addNavigationSetups() {
        title = "Валюта"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Helpers

    // MARK: Private

    private func showActivityIndicator() {
        view.isUserInteractionEnabled = false
        let viewController = tabBarController ?? navigationController ?? self
        activityIndicator.frame = CGRect(x: 0,
                                         y: 0,
                                         width: viewController.view.frame.width,
                                         height: viewController.view.frame.height)
        viewController.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    private func hideActivityIndicator() {
        view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyes.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: InfoCurrencyTableViewCell.identifier, for: indexPath) as? InfoCurrencyTableViewCell {
            cell.set(currencyes[indexPath.row].curAbbreviation,
                     currencyes[indexPath.row].curAbbreviation,
                     String(format: "%.2f", currencyes[indexPath.row].curOfficialRate))
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.transferCurrencyInfo(currencyes[indexPath.row])
    }
}
