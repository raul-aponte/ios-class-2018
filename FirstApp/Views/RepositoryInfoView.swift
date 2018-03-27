import UIKit

class RepositoryInfoView: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingView: RatingControl!
    @IBOutlet weak var contentTextView: UITextView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        //Bundle.main.loadNibNamed("RepositoryInfoView", owner: self, options: nil)
    }
}
