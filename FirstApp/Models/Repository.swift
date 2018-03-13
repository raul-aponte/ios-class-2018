import SwiftyJSON

struct Repository {
    var name: String

    init(json: JSON) {
        name = json["name"].stringValue
    }
    init(name: String) {
        self.name = name
    }
}
