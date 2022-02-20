import SkeletonView
import UIKit

final class CurrencyCalculatorView: UIView {
    // MARK: - Properties
    
    // MARK: Private
    
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
        addMainStackViewConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
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
        
        anyCurrencyImage.translatesAutoresizingMaskIntoConstraints = false
        anyCurrencyImage.topAnchor.constraint(equalTo: anyCurrencyStackView.topAnchor, constant: 20).isActive = true
        anyCurrencyImage.bottomAnchor.constraint(equalTo: anyCurrencyStackView.bottomAnchor, constant: -20).isActive = true
        anyCurrencyImage.widthAnchor.constraint(equalTo: anyCurrencyStackView.widthAnchor, multiplier: 0.1).isActive = true
        
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
        bynImage.image = UIImage(named: "BY")
        anyCurrencyImage.image = UIImage(named: "USA")
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
    
    private func addBynTextFieldSetups() {
        bynTextField.placeholder = "BYN"
        bynTextField.indent(size: 10)
        bynTextField.layer.cornerRadius = 15
        bynTextField.layer.borderWidth = 1
        bynTextField.layer.borderColor = UIColor.darkGray.cgColor
        bynTextField.keyboardType = .numberPad
    }
    
    private func addAnyCurrencyTextFieldSetups() {
        anyCurrencyTextField.placeholder = "USD"
        anyCurrencyTextField.indent(size: 10)
        anyCurrencyTextField.layer.cornerRadius = 15
        anyCurrencyTextField.layer.borderWidth = 1
        anyCurrencyTextField.layer.borderColor = UIColor.darkGray.cgColor
        anyCurrencyTextField.keyboardType = .numberPad
    }
}
