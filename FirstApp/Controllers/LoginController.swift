import UIKit
import RxSwift

class LoginController: UIViewController {

    private let sessionClient = SessionClient()
    private var disposable: Disposable?

    // MARK: Controls
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        disposable?.dispose()
    }

    // MARK: Actions
    @IBAction func loginButtonTap() {
        attemptToLogin()
    }

    // MARK: Functions
    private func attemptToLogin() {
        showProgress()

        disposable = sessionClient.login(user: "", password: "").subscribe(
            onNext: { self.successfulLogin($0) },
            onError: { self.showError($0) },
            onCompleted: { self.hideProgress() }
        )
    }

    private func successfulLogin(_ token: AccessToken) {
        Settings.userMail = userTextField.textValue
        let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() {
            present(controller, animated: true)
        }
    }
}

