import UIKit

class RepositoryInfoView: UIView {

    @IBOutlet private var contentView: UIView!

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingControl: RatingControlView!
    @IBOutlet private weak var contentTextView: UITextView!

    var repository: Repository? {
        didSet {
            refreshInfo()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commondInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commondInit()
    }

    private func commondInit() {
        Bundle.main.loadNibNamed("RepositoryInfoView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    private func refreshInfo() {
        nameLabel.text = repository?.name
        ratingControl.rating = repository?.rating ?? 0
        contentTextView.text = repository?.description
    }
}
