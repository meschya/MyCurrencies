import UIKit

final class Sections: UITableViewHeaderFooterView {
    // MARK: - Identifier

    static let identifier = "Sections"

    // MARK: - Setups

    // MARK: Public

    func addUI(headerText text: String) {
        textLabel?.text = text
        textLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        textLabel?.textColor = .white
    }
}
