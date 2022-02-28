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
        tableView.backgroundColor = Colors.xDarkNavy
        navigationController?.setNavigationBarHidden(true, animated: true)
        tableView.register(Sections.self, forHeaderFooterViewReuseIdentifier: Sections.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Sections.identifier) as? Sections {
            header.addUI(headerText: sections[section])
            return header
        }
        return UIView()
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {}

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sections = tableView.dequeueReusableCell(withIdentifier: Sections.identifier)
        return sections
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
    func viewScreen(_ list: AllCurrencyesTableViewController) {
        present(list, animated: true)
    }
}
