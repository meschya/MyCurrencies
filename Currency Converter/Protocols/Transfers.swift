import Foundation

protocol TransferActionsBetweenVCDelegate: AnyObject {
    func viewScreen(_ list: AllCurrencyesTableViewController)
}

protocol TransferCurrencyBetweenVCDelegate: AnyObject {
    func transferCurrencyInfo(_ currency: Currency)
}
