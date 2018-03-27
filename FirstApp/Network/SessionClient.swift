import RxSwift
import Alamofire

class SessionClient: BaseClient {
    func login(user: String, password: String, callback: @escaping (String?) -> Void) {
        let url = "\(baseUrl)/authorizations/clients/\(Connection.clientId)"
        let params: [String : Any] = [
            "note": "admin script",
            "client_secret": Connection.clientSecret,
            "scopes": [
                "public_repo"
            ]
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
