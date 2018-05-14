import UIKit

class UserTabBarController: UITabBarController {
    @IBAction func closeButtonTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
