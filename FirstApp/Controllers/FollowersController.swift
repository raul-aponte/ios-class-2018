import UIKit

class FollowersController: BaseController, UICollectionViewDataSource {
    private let userClient = UserClient()
    private let cellId = "UserCell"

    private var followers = [User]() {
        didSet {
            followersCollectionView.reloadData()
        }
    }

    @IBOutlet private weak var userLabel: UILabel!
    @IBOutlet weak var followersCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollection()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchFollowers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposable?.dispose()
    }

    private func configCollection() {
        followersCollectionView.dataSource = self
        followersCollectionView.register(
            UINib(nibName: cellId, bundle: nil),
            forCellWithReuseIdentifier: cellId
        )
    }

    private func fetchFollowers() {
        guard let user = Settings.currentUser else {
            return
        }
        userLabel.text = user
        showProgress()
        disposable =  userClient.getFollowers(forUser: user).subscribe(
            onNext: { self.followers = $0 },
            onError: { self.showError($0) },
            onCompleted: { self.hideProgress() }
        )
    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

        if let userCell = cell as? UserCell {
            userCell.user = followers[indexPath.row]
        }

        return cell
    }
}
