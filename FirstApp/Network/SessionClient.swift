import RxSwift

class SessionClient: BaseClient {
    func login(user: String, password: String) -> Observable<AccessToken> {
        let endpoint = "/authorizations/clients/\(Connection.clientId)"
        let params: [String : Any] = [
            "note": "admin script",
            "client_secret": Connection.clientSecret,
            "scopes": [
                "public_repo"
            ]
        ]
        return request(put: endpoint, params: params).map { AccessToken(json: $0) }
    }
}
