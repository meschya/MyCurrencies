import UIKit

final class AllCurrencyesTableViewController: UITableViewController {
    // MARK: - Properties

    // MARK: Private

    private var currencyes: [Currency] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private let countryImages: [String] = ["","","","",""]

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSetups()
        fetchDataCurrency()
    }

    // MARK: - API

    private func fetchDataCurrency() {
        APIManager.instance.getCurrencys(completion: { currencyes in
            self.currencyes = currencyes
        })
    }

    // MARK: - Setups

    // MARK: Private

    private func addSetups() {
        addTableViewSetups()
        addNavigationSetups()
    }

    private func addTableViewSetups() {
        tableView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 35/255, alpha: 1.0)
        tableView.register(InfoCurrencyTableViewCell.self,
                           forCellReuseIdentifier: InfoCurrencyTableViewCell.identifier)
        tableView.separatorStyle = .none
    }

    private func addNavigationSetups() {
        title = "Валюта"
        navigationController?.navigationBar.prefersLargeTitles = true
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
            cell.set(currencyes[indexPath.row].Cur_Abbreviation,
                     String(format: "%.3f", currencyes[indexPath.row].Cur_OfficialRate),
                     UIImage(named: countryImages[indexPath.row])!)
            return cell
        }
        return UITableViewCell()
    }
}
