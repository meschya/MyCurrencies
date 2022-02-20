import Foundation

struct Currency: Codable {
    let Cur_ID: Int
    let Date, Cur_Abbreviation: String
    let Cur_Scale: Int
    let Cur_Name: String
    let Cur_OfficialRate: Double
}
