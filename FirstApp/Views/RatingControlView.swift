import UIKit

class RatingControlView: UIView {
    private let filledStarImage = UIImage(named: "rating_star_filled")
    private let emptyStarImage = UIImage(named: "rating_star_empty")
    private let starCount = 5

    var rating: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons: [UIButton] {
        return subviews.compactMap { $0 as? UIButton }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        for _ in 0..<starCount {
            let button = UIButton()
            button.addTarget(self, action: #selector(RatingControlView.ratingButtonTapped(_:)), for: .touchUpInside)

            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)

            addSubview(button)
        }
    }

    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)

        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)

        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }

        updateButtonSelectionStates()
    }

    func updateButtonSelectionStates() {
        ratingButtons.enumerated().forEach { (index, button) in
            button.isSelected = index < rating
        }
    }

    @objc func ratingButtonTapped(_ button: UIButton){
    }
}
