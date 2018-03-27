import RxSwift
import SwiftyJSON
import Alamofire

class BaseClient {
    private final let baseUrl = "https://api.github.com"
    let headers = ["Accept": "application/vnd.github.v3+json"]

    func request(get endpoint: String, params: [String: Any]? = nil) -> Observable<JSON> {
        return getObservable(method: .get, endpoint: endpoint, params: params)
    }

    func request(post endpoint: String, params: [String: Any]? = nil) -> Observable<JSON> {
        return getObservable(method: .get, endpoint: endpoint, params: params, encoding: JSONEncoding.default)
    }

    private func getObservable(
        method: HTTPMethod,
        endpoint: String,
        params: [String: Any]? = nil,
        encoding: ParameterEncoding = URLEncoding.default) -> Observable<JSON> {

        return Observable<JSON>.create({ (observer) -> Disposable in
            let url = self.baseUrl + endpoint
            let request = Alamofire.request(url,method: method,parameters: params,encoding: encoding, headers: self.headers).responseJSON(completionHandler: { (response) in
                let statusCode = response.response?.statusCode ?? 500
                let result = response.result

                if result.isSuccess {
                    if let content = result.value {
                        let json = JSON(content)
                        print("Json Response:\(json)")
                        if statusCode >= 200 && statusCode < 400 {
                            observer.onNext(json)
                        }
                    }
                } else if let error = result.error {
                    observer.onError(error)
                }
                observer.onCompleted()
            })

            return Disposables.create {
                request.cancel()
            }
        })
    }
}
