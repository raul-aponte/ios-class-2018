import UIKit

class UserCell: UICollectionViewCell {
    @IBOutlet private weak var userLabel: UILabel!
    @IBOutlet private weak var userImageView: UIImageView!

    var user: User? {
        didSet {
            userLabel.text = user?.name
        }
    }
}
