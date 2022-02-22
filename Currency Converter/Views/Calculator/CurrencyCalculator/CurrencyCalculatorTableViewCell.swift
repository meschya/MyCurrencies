import UIKit

final class CurrencyCalculatorTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "ExchangeRatesTableViewCell"

    // MARK: - Properties

    // MARK: Private

     let currencyCalculatorView: CurrencyCalculatorView = .init()

    // MARK: - LIfecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(currencyCalculatorView)
        contentView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 35/255, alpha: 1.0)
        addCurrencyCalculatorViewConstraints()
    }
    

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addCurrencyCalculatorViewConstraints() {
        currencyCalculatorView.translatesAutoresizingMaskIntoConstraints = false
        currencyCalculatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        currencyCalculatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        currencyCalculatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        currencyCalculatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}

extension CurrencyCalculatorTableViewCell: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
