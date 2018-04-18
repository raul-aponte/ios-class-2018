import SwiftyJSON

struct AccessToken {
    let id: Int
    let token: String
    let hashedToken: String

    init(json: JSON) {
        id = json["id"].intValue
        token = json["token"].stringValue
        hashedToken = json["hashed_token"].stringValue
    }

    /*init?(json: JSON) {
     guard let id = json["id"].int,
     let token = json["token"].string,
     let hashedToken = json["hashed_token"].string else {
     return nil
     }
     self.id = id
     self.token = token
     self.hashedToken = hashedToken
     }*/
}
