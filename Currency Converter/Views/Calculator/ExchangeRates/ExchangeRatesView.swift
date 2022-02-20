import SkeletonView
import UIKit

final class ExchangeRatesView: UIView {
    // MARK: - Properties

    private let mainStackView: UIStackView = .init()
    private let labelsStackView: UIStackView = .init()
    private var currencies: [Currency] = []
    private let countryImages: [String] = ["USD", "EUR", "RU"]
    private let nameLabels: [String] = ["Валюта", "Покупка", "Продажа"]
    private let infoLabel: UILabel = .init()

    // MARK: - LIfecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addMainStackViewConstraints()
        fetchDataCurrencyByUsd(431)
        fetchDataCurrencyByEur(451)
        fetchDataCurrencyByRu(456)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API

    private func fetchDataCurrencyByUsd(_ id: Int) {
        APIManager.instance.getCurrencysBy(id: id) { currency in
            self.currencies.append(currency)
        }
    }

    private func fetchDataCurrencyByEur(_ id: Int) {
        APIManager.instance.getCurrencysBy(id: id) { currency in
            self.currencies.append(currency)
        }
    }

    private func fetchDataCurrencyByRu(_ id: Int) {
        APIManager.instance.getCurrencysBy(id: id) { currency in
            self.currencies.append(currency)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.hideSkeleton()
                self.addCurrencys(data: self.currencies)
            }
        }
    }

    // MARK: - Constraints

    // MARK: Private

    private func addMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }

    // MARK: - Setups

    // MARK: Private

    private func addSubviews() {
        addSubviews(mainStackView)
        mainStackView.addArrangedSubview(labelsStackView)
    }

    private func addSetups() {
        addViewSetups()
        addMainStackViewSetups()
        addLabelsStackViewSetups()
        addLabels()
        addInfoLabelSetups()
    }

    private func addViewSetups() {
        backgroundColor = UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0)
        layer.cornerRadius = 15
        isSkeletonable = true
        skeletonCornerRadius = 15
        showAnimatedSkeleton(usingColor: UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0),
                             animation: nil,
                             transition: .crossDissolve(0.25))
    }

    private func addMainStackViewSetups() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .fill
    }

    private func addLabelsStackViewSetups() {
        labelsStackView.axis = .horizontal
        labelsStackView.distribution = .fillEqually
        labelsStackView.alignment = .fill
    }

    private func addInfoLabelSetups() {
        infoLabel.text = "* данные НацБанка Республики Беларусь"
        infoLabel.textColor = .darkGray
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }

    // MARK: - Helpers

    // MARK: Private

    private func addCurrencys(data: [Currency]) {
        var counter = 0
        for item in data {
            counter += 1
            let stack = CurrencyStackView()
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.alignment = .fill
            stack.set(CountryImage: UIImage(named: countryImages[counter - 1])!,
                      Currency: " \(item.Cur_Scale) \(item.Cur_Abbreviation)",
                      BuyCurrency: Double(item.Cur_OfficialRate),
                      SellCurrency: Double(item.Cur_OfficialRate))
            mainStackView.addArrangedSubview(stack)
        }
        mainStackView.addArrangedSubview(infoLabel)
    }

    private func addLabels() {
        var counter = 0
        for item in nameLabels {
            counter += 1
            let label = UILabel()
            label.text = item
            label.textColor = .darkGray
            label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            if counter == 1 {
                label.textAlignment = .left
            } else {
                label.textAlignment = .right
            }
            labelsStackView.addArrangedSubview(label)
        }
    }
}
