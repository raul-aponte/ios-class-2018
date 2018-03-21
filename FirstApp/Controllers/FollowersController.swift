import UIKit

class FollowersController: UIViewController, UICollectionViewDataSource {
    private let cellId = "UserCell"

    private var followers = [User]()

    @IBOutlet weak var followersCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        followers = dummyData()
        configCollection()
    }

    private func configCollection() {
        followersCollectionView.dataSource = self
        followersCollectionView.register(
            UINib(nibName: cellId, bundle: nil),
            forCellWithReuseIdentifier: cellId
        )
    }

    private func dummyData() -> [User] {
        return [
            User(name: "bla 1"),
            User(name: "blah 2")
        ]
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
