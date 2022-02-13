import UIKit

final class ExchangeRatesView: UIView {
    // MARK: - Properties

    private let labelsStackView: UIStackView = .init()
    private let currencyLabel: UILabel = .init()
    private let buyLabel: UILabel = .init()
    private let sellLabel: UILabel = .init()

    // MARK: - LIfecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addSubviews(labelsStackView)
        labelsStackView.addArrangedSubviews(currencyLabel,
                                            buyLabel,
                                            sellLabel)
    }
}
