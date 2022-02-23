import SkeletonView
import UIKit

final class CurrencyCalculatorView: UIView {
    // MARK: - Properties
    
    // MARK: Public
    
    weak var delegate: TransferActionsBetweenVCDelegate?
    
    // MARK: Private

    private var currency: Currency? {
        didSet {
            set(currency!.Cur_Abbreviation, currency!.Cur_OfficialRate)
            bynTextField.text = ""
            anyCurrencyTextField.text = ""
        }
    }

    private var scaleCurrency: Double = .init()
    private let mainStackView: UIStackView = .init()
    private let bynStackView: UIStackView = .init()
    private let anyCurrencyStackView: UIStackView = .init()
    private let bynImage: UIImageView = .init()
    private let bynTextField: UITextField = .init()
    private let anyCurrencyImage: UIImageView = .init()
    private let anyCurrencyTextField: UITextField = .init()
    
    // MARK: - LIfecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addConstraints() {
        addMainStackViewConstraints()
        addBynImageConstraint()
        addAnyCurrencyImageConstraints()
        addBynAndAnyCurrencyTFConstraints()
    }
    
    private func addMainStackViewConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35).isActive = true
        addBynImageConstraint()
    }
    
    private func addBynImageConstraint() {
        bynImage.translatesAutoresizingMaskIntoConstraints = false
        bynImage.topAnchor.constraint(equalTo: bynStackView.topAnchor, constant: 20).isActive = true
        bynImage.bottomAnchor.constraint(equalTo: bynStackView.bottomAnchor, constant: -20).isActive = true
        bynImage.widthAnchor.constraint(equalTo: bynStackView.widthAnchor, multiplier: 0.1).isActive = true
    }
    
    private func addAnyCurrencyImageConstraints() {
        anyCurrencyImage.translatesAutoresizingMaskIntoConstraints = false
        anyCurrencyImage.topAnchor.constraint(equalTo: anyCurrencyStackView.topAnchor, constant: 20).isActive = true
        anyCurrencyImage.bottomAnchor.constraint(equalTo: anyCurrencyStackView.bottomAnchor, constant: -20).isActive = true
        anyCurrencyImage.widthAnchor.constraint(equalTo: anyCurrencyStackView.widthAnchor, multiplier: 0.1).isActive = true
    }
    
    private func addBynAndAnyCurrencyTFConstraints() {
        bynTextField.translatesAutoresizingMaskIntoConstraints = false
        bynTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        anyCurrencyTextField.translatesAutoresizingMaskIntoConstraints = false
        anyCurrencyTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addSubviews(mainStackView)
        mainStackView.addArrangedSubviews(bynStackView, anyCurrencyStackView)
        bynStackView.addArrangedSubviews(bynImage, bynTextField)
        anyCurrencyStackView.addArrangedSubviews(anyCurrencyImage, anyCurrencyTextField)
    }
    
    private func addSetups() {
        addViewSetups()
        addMainStackViewSetups()
        addBynStackViewSetups()
        addAnyCurrencyStackViewSetups()
        addBynTextFieldSetups()
        addAnyCurrencyTextFieldSetups()
        addAnyCurrencyImageSetups()
        addBynAndAnyCurrencyImageSetups()
    }
    
    private func addViewSetups() {
        backgroundColor = UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0)
        layer.cornerRadius = 15
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.isSkeletonable = true
            self.skeletonCornerRadius = 15
            self.showAnimatedSkeleton(usingColor: UIColor(red: 36/255, green: 34/255, blue: 49/255, alpha: 1.0),
                                      animation: nil,
                                      transition: .crossDissolve(0.25))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.hideSkeleton()
        }
    }
    
    private func addMainStackViewSetups() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .fill
        mainStackView.spacing = 20
    }
    
    private func addBynStackViewSetups() {
        bynStackView.axis = .horizontal
        bynStackView.distribution = .fillProportionally
        bynStackView.alignment = .center
        bynStackView.spacing = 10
    }
    
    private func addAnyCurrencyStackViewSetups() {
        anyCurrencyStackView.axis = .horizontal
        anyCurrencyStackView.distribution = .fillProportionally
        anyCurrencyStackView.alignment = .center
        anyCurrencyStackView.spacing = 10
    }
    
    private func addBynAndAnyCurrencyImageSetups() {
        bynImage.image = UIImage(named: "BY")
        anyCurrencyImage.image = UIImage(named: "coin")
    }
    
    private func addBynTextFieldSetups() {
        bynTextField.placeholder = "BYN"
        bynTextField.indent(size: 10)
        bynTextField.layer.cornerRadius = 15
        bynTextField.layer.borderWidth = 1
        bynTextField.layer.borderColor = UIColor.darkGray.cgColor
        bynTextField.keyboardType = .numberPad
        bynTextField.addTarget(self, action: #selector(bynTextFieldDidChange(_:)),
                               for: .editingChanged)
    }
    
    private func addAnyCurrencyTextFieldSetups() {
        anyCurrencyTextField.placeholder = "Выберите валюту"
        anyCurrencyTextField.indent(size: 10)
        anyCurrencyTextField.layer.cornerRadius = 15
        anyCurrencyTextField.layer.borderWidth = 1
        anyCurrencyTextField.layer.borderColor = UIColor.darkGray.cgColor
        anyCurrencyTextField.keyboardType = .numberPad
        anyCurrencyTextField.addTarget(self, action: #selector(anyCurrencyFieldDidChange(_:)),
                                       for: .editingChanged)
    }
    
    private func addAnyCurrencyImageSetups() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(showListCurrencyes))
        anyCurrencyImage.isUserInteractionEnabled = true
        anyCurrencyImage.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    
    // MARK: Private
    
    @objc private func showListCurrencyes() {
        let listVC = AllCurrencyesTableViewController()
        listVC.modalPresentationStyle = .popover
        listVC.modalTransitionStyle = .crossDissolve
        let popOverVC = listVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = anyCurrencyImage
        popOverVC?.sourceRect = CGRect(x: anyCurrencyImage.bounds.midX,
                                       y: anyCurrencyImage.bounds.minY,
                                       width: 0,
                                       height: 0)
        listVC.preferredContentSize = CGSize(width: 300, height: 250)
        listVC.delegate = self
        delegate?.viewScreen(listVC)
    }
    
    // MARK: - Helpers
    
    // MARK: Private
    
    private func set(_ textAbbreviation: String, _ scale: Double) {
        anyCurrencyImage.image = UIImage(named: textAbbreviation)
        anyCurrencyTextField.placeholder = textAbbreviation
        scaleCurrency = scale
    }
    
    @objc func bynTextFieldDidChange(_ textField: UITextField) {
        if anyCurrencyImage.image != UIImage(named: "coin") {
            let byn = Double(bynTextField.text!) ?? 1
            anyCurrencyTextField.text = String(format: "%.3f", byn/scaleCurrency)
        }
    }
    
    @objc func anyCurrencyFieldDidChange(_ textField: UITextField) {
        if anyCurrencyImage.image != UIImage(named: "coin") {
            let anyCurrency = Double(anyCurrencyTextField.text!) ?? 1
            bynTextField.text = String(format: "%.3f", anyCurrency * scaleCurrency)
        }
    }
}

// MARK: - Extensions

extension CurrencyCalculatorView: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension CurrencyCalculatorView: TransferCurrencyBetweenVCDelegate {
    func transferMovieInfo(_ currency: Currency) {
        self.currency = currency
    }
}
