import RxSwift

class UserClient: BaseClient {
    func login(user: String) -> Observable<User?> {
        let endpoint = "users/\(user)"
        return request(get: endpoint).map { User(json: $0) }
    }

    func getFollowers(forUser user: String) -> Observable<[User]> {
        let endpoint = "users/\(user)/followers"
        return request(get: endpoint).map({ json -> [User] in
            return json.arrayValue.compactMap({ User(json: $0) })
        })
    }
}
