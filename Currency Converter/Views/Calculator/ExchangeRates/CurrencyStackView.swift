import UIKit

final class CurrencyStackView: UIStackView {
    // MARK: - Properties
    
    // MARK: Private
    
    private var countryImage: UIImage = .init()
    private var textCurrency: String = .init()
    private let currencyLabel: UILabel = .init()
    private let buyLabel: UILabel = .init()
    private let sellLabel: UILabel = .init()
    
    // MARK: - LIfecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func set(CountryImage image: UIImage, Currency currency: String, BuyCurrency buyCurrency: Double, SellCurrency sellCurrency: Double) {
        addCurrencyLabelSetups(image, currency)
        buyLabel.text = String(buyCurrency)
        sellLabel.text = String(sellCurrency)
    }
    
    // MARK: - Setups

    // MARK: Private
    
    private func addSubviews() {
        addArrangedSubviews(
            currencyLabel,
            buyLabel,
            sellLabel)
    }
    
    private func addSetups() {
        addStackViewSetups()
        addBuyLabelSetups()
        addSellLabelSetups()
    }
    
    private func addStackViewSetups() {
        axis = .vertical
        alignment = .leading
        distribution = .fillProportionally
    }
    
    private func addCurrencyLabelSetups(_ image: UIImage, _ text: String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        let attachmentString = NSMutableAttributedString(attachment: attachment)
        
        let firstAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .light)
        ]
        
        let firstString = NSMutableAttributedString(string: text, attributes: firstAttributes)
        
        attachmentString.append(firstString)

        currencyLabel.attributedText = attachmentString
    }
    
    private func addBuyLabelSetups() {
        buyLabel.textColor = .white
        buyLabel.textAlignment = .right
        buyLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    }
    
    private func addSellLabelSetups() {
        sellLabel.textColor = .white
        sellLabel.textAlignment = .right
        sellLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
    }
}
