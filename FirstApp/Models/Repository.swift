import SwiftyJSON

struct Repository {
    let id: Int
    let name: String
    let owner: User?

    init?(json: JSON) {
        guard let _id = json["id"].int, let _name = json["name"].string else {
            return nil
        }
        id = _id
        name = _name
        owner = User(json: json["owner"])
    }
}
