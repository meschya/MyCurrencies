import UIKit

final class CurrencyStackView: UIStackView {
    // MARK: - Properties
    
    private let countryImageView: UIImageView = .init()
    private let currencyLabel: UILabel = .init()
    private let buyLabel: UILabel = .init()
    private let sellLabel: UILabel = .init()
    
    // MARK: - LIfecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addCountryImageViewConstraints()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func set(CountryImage image: UIImage, Currency currency: String, BuyCurrency buyCurrency: Double, SellCurrency sellCurrency: Double) {
        countryImageView.image = image
        currencyLabel.text = currency
        buyLabel.text = String(buyCurrency)
        sellLabel.text = String(sellCurrency)
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addCountryImageViewConstraints() {
        countryImageView.translatesAutoresizingMaskIntoConstraints = false
        countryImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        countryImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    // MARK: - Setups

    // MARK: Private
    
    private func addSubviews() {
        addArrangedSubviews(countryImageView,
                            currencyLabel,
                            buyLabel,
                            sellLabel)
    }
    
    private func addSetups() {
        addStackViewSetups()
        addCountryImageViewSetups()
        addCurrencyLabelSetups()
        addBuyLabelSetups()
        addSellLabelSetups()
    }
    
    private func addStackViewSetups() {
        axis = .vertical
        alignment = .fill
        distribution = .fillProportionally
    }
    
    private func addCountryImageViewSetups() {
        countryImageView.layer.cornerRadius = countryImageView.frame.size.width / 2
        countryImageView.clipsToBounds = true
    }
    
    private func addCurrencyLabelSetups() {
        currencyLabel.textColor = .black
        currencyLabel.textAlignment = .left
        currencyLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    }
    
    private func addBuyLabelSetups() {
        buyLabel.textColor = .black
        buyLabel.textAlignment = .left
        buyLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    }
    
    private func addSellLabelSetups() {
        sellLabel.textColor = .black
        sellLabel.textAlignment = .left
        sellLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    }
}
