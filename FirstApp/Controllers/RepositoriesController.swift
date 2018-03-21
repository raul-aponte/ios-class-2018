import UIKit

final class RepositoriesController: UIViewController {
    private let cellId = "RepositoryCell"
    fileprivate var repos = [Repository]()
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var reposTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTable()
        repos = dummyData()
    }

    private func configureTable() {
        reposTableView.dataSource = self
        reposTableView.register(
            UINib(nibName: cellId, bundle: nil),
            forCellReuseIdentifier: cellId
        )
    }

    private func dummyData() -> [Repository] {
        return [
            Repository(name: "Blah 1"),
            Repository(name: "Blah 2"),
            Repository(name: "Blah 3"),
            Repository(name: "Blah 4"),
            Repository(name: "Blah 5"),
        ]
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
