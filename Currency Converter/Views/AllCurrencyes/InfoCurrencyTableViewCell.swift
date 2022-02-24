import UIKit

final class InfoCurrencyTableViewCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = "InfoCurrencyTableViewCell"
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let mainStackView: UIStackView = .init()
    private let countryImageView: UIImageView = .init()
    private let currencyView: UIView = .init()
    private let nameCurrencyLabel: UILabel = .init()
    private let scaleCurrencyLabel: UILabel = .init()

    // MARK: - LIfecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 35/255, alpha: 1.0)
        addSubviews()
        addSetups()
        addConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func set(_ image: String, _ name: String, _ scale: String) {
        countryImageView.image = UIImage(named: image)
        nameCurrencyLabel.text = name
        scaleCurrencyLabel.text = scale
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addConstraints() {
        addCryptoViewConstraints()
        addMainStackViewConstraints()
        addCountryImageConstraints()
        addNameCurrencyLabelConstraints()
    }
    
    private func addCryptoViewConstraints() {
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        currencyView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        currencyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        currencyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        currencyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func addMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: currencyView.topAnchor, constant: 10).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: currencyView.leadingAnchor, constant: 10).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: currencyView.trailingAnchor, constant: -10).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: currencyView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func addCountryImageConstraints() {
        countryImageView.translatesAutoresizingMaskIntoConstraints = false
        countryImageView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 0.13).isActive = true
    }
    
    private func addNameCurrencyLabelConstraints() {
        nameCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCurrencyLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 0.25).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        contentView.addSubview(currencyView)
        currencyView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(countryImageView)
        mainStackView.addArrangedSubview(nameCurrencyLabel)
        mainStackView.addArrangedSubview(scaleCurrencyLabel)
    }
    
    private func addSetups() {
        addCurrencyViewSetups()
        addMainStackViewSetups()
        addNameCoinLabelSetups()
        addScaleCoinLabelSetups()
    }
    
    private func addCurrencyViewSetups() {
        currencyView.backgroundColor = UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0)
        currencyView.layer.cornerRadius = 10
    }
    
    private func addMainStackViewSetups() {
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillProportionally
        mainStackView.alignment = .fill
        mainStackView.spacing = 15
    }
    
    private func addNameCoinLabelSetups() {
        nameCurrencyLabel.textAlignment = .left
        nameCurrencyLabel.textColor = .white
        nameCurrencyLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    private func addScaleCoinLabelSetups() {
        scaleCurrencyLabel.textAlignment = .right
        scaleCurrencyLabel.textColor = UIColor(red: 175/255, green: 173/255, blue: 185/255, alpha: 1.0)
        scaleCurrencyLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
}
