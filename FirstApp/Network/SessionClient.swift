import RxSwift
import Alamofire

class SessionClient: BaseClient {
    func login(user: String, password: String, callback: @escaping (String?) -> Void) {
        let params = ["username": user]
        Alamofire.request(baseUrl, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
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
