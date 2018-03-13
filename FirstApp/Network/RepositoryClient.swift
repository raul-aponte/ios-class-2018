import Alamofire

class RepositoryClient: BaseClient {
    func getRepos(forUser user: String, callback: @escaping ([Repository]) -> Void) {
        let url = "\(baseUrl)/repos"
        Alamofire.request(url, method: .get, parameters: [:], encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            print(response)
            response.result.ifSuccess {
                //callback("")
            }
            response.result.ifFailure {
                //callback(nil)
            }

        }
    }
}
