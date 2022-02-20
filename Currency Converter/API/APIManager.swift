import Alamofire
import Foundation
import UIKit

enum Costants {
    static let allCurrencyURL = "https://www.nbrb.by/api/exrates/rates?periodicity=0"
    static let byCurrencyURL = "https://www.nbrb.by/api/exrates/rates/"
}

final class APIManager {
    static let instance = APIManager()

    // MARK: - Get Currency

    func getCurrencys(completion: @escaping ([Currency]) -> Void) {
        AF.request(Costants.allCurrencyURL).responseDecodable(of: [Currency].self) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getCurrencysBy(id: Int, completion: @escaping ((Currency) -> Void)) {
        AF.request(Costants.byCurrencyURL + "\(id)").responseDecodable(of: Currency.self) { response in
            switch response.result {
            case .success(let model):
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }

    private init() {}
}
