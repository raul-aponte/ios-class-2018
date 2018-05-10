import UIKit
import RxSwift

class LoginController: BaseController {

    private let userClient = UserClient()

    // MARK: Controls
    @IBOutlet weak var userTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: Actions
    @IBAction func loginButtonTap() {
        attemptToLogin()
    }

    // MARK: Functions
    private func attemptToLogin() {
        let user = userTextField.textValue
        if user.isEmpty {
            showAlert("User is empty") {
                self.userTextField.becomeFirstResponder()
            }
            return
        }
        showProgress()
        disposable = userClient.login(user: user).subscribe(
            onNext: { self.successfulLogin($0) },
            onError: { self.showError($0) },
            onCompleted: { self.hideProgress() }
        )
    }

    private func successfulLogin(_ user: User?) {
        guard let user = user else {
            showAlert("User not found")
            return
        }
        Settings.currentUser = user.login
        let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() {
            present(controller, animated: true)
        }
    }
}

