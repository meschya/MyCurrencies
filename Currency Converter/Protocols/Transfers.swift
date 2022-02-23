import Foundation

protocol TransferActionsBetweenVCDelegate: AnyObject {
    func viewScreen(_ list: AllCurrencyesTableViewController)
}

protocol TransferCurrencyBetweenVCDelegate: AnyObject {
    func transferMovieInfo(_ currency: Currency)
}
