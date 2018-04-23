import RxSwift

class RepositoryClient: BaseClient {
    func getRepos(forUser user: String) -> Observable<[Repository]> {
        return request(get: "users/\(user)/repos").map({ json -> [Repository] in
            return json.arrayValue.compactMap({ Repository(json: $0) })
        })
    }
}
