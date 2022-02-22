import UIKit

final class CurrencyConverterTableViewController: UITableViewController {
    // MARK: - Properties

    // MARK: Private

    private let sections: [String] = ["Курсы валют", "Калькулятор валют"]
    private var currency: [Currency] = []

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewSetups()
    }

    // MARK: - Setups

    // MARK: Private

    private func addViewSetups() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 35/255, alpha: 1.0)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: header.bounds.width, height: header.bounds.height)
        header.textLabel?.textAlignment = .center
        header.textLabel?.textColor = .white
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == "Курсы валют" {
            tableView.register(ExchangeRatesTableViewCell.self,
                               forCellReuseIdentifier: ExchangeRatesTableViewCell.identifier)
            if let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeRatesTableViewCell.identifier, for: indexPath) as? ExchangeRatesTableViewCell {
                return cell
            }
        } else if sections[indexPath.section] == "Калькулятор валют" {
            tableView.register(CurrencyCalculatorTableViewCell.self,
                               forCellReuseIdentifier: CurrencyCalculatorTableViewCell.identifier)
            if let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCalculatorTableViewCell.identifier, for: indexPath) as? CurrencyCalculatorTableViewCell {
                cell.currencyCalculatorView.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension CurrencyConverterTableViewController: TransferActionsBetweenVCDelegate {
    func nextScreen(_ list: ListCurrencyesTableViewController) {
        present(list, animated: true)
    }
}
