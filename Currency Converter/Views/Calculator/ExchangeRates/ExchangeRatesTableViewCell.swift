import UIKit

final class ExchangeRatesTableViewCell: UITableViewCell {
    // MARK: - Identifier

    static let identifier = "ExchangeRatesTableViewCell"

    // MARK: - Properties

    // MARK: Private

    private let exchangeRatesView: ExchangeRatesView = .init()

    // MARK: - LIfecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(exchangeRatesView)
        contentView.backgroundColor = Colors.xDarkNavy
        addExchangeRatesViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Constraints

    // MARK: Private

    private func addExchangeRatesViewConstraints() {
        exchangeRatesView.translatesAutoresizingMaskIntoConstraints = false
        exchangeRatesView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        exchangeRatesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        exchangeRatesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        exchangeRatesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
