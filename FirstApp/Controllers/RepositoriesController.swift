import UIKit

final class RepositoriesController: BaseController {
    private let reposClient = RepositoryClient()
    private let cellId = "RepositoryCell"
    fileprivate var repos = [Repository]() {
        didSet {
            reposTableView.reloadData()
        }
    }
    
    @IBOutlet private weak var userLabel: UILabel!
    @IBOutlet weak var reposTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchRepos()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposable?.dispose()
    }

    private func configureTable() {
        reposTableView.dataSource = self
        reposTableView.delegate = self
        reposTableView.register(
            UINib(nibName: cellId, bundle: nil),
            forCellReuseIdentifier: cellId
        )
    }

    private func fetchRepos() {
        guard let user = Settings.currentUser else {
            return
        }
        userLabel.text = user
        showProgress()
        disposable = reposClient.getRepos(forUser: user).subscribe(
            onNext: { self.repos = $0 },
            onError: { self.showError($0) },
            onCompleted: { self.hideProgress() }
        )
    }

    fileprivate func showRepoInfo(repository: Repository) {
        let sb = UIStoryboard(name: "Repository", bundle: nil)
        if let vc = sb.instantiateInitialViewController() as? RepositoryInfoController {
            vc.repository = repository
            parent?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: UITableViewDelegate
extension RepositoriesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showRepoInfo(repository: repos[indexPath.row])
    }
}

// MARK: UITableViewDataSource
extension RepositoriesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        if let repoCell = cell as? RepositoryCell {
            repoCell.repository = repos[indexPath.row]
        }
        return cell
    }
}
