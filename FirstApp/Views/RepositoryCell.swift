import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet private weak var repoImageView: UIImageView!
    @IBOutlet private weak var repoLabel: UILabel!

    var repository: Repository? {
        didSet {
            repoLabel.text = repository?.name
        }
    }
}
