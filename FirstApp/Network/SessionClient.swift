import RxSwift
import Alamofire

class SessionClient: BaseClient {
    func login(user: String, password: String, callback: @escaping (String?) -> Void) {
        let url = "\(baseUrl)/authorizations"
        let params = [
            "note": "admin script",
            "client_id": Connection.clientId,
            "client_secret": Connection.clientSecret
        ]
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            print(response)
            response.result.ifSuccess {
                callback("")
            }
            response.result.ifFailure {
                callback(nil)
            }

        }
    }

}
