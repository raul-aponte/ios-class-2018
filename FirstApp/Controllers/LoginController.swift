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
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func loginButtonTap() {
        successfulLogin()
    }

    // MARK: Functions
    private func attemptToLogin() {
        let user = userTextField.textValue
        let password = passwordTextField.textValue

        sessionClient.login(user: user, password: password) { (result) in
            if result == nil {

            } else {
                self.successfulLogin()
            }
        }
    }

    private func successfulLogin() {
        Settings.userMail = userTextField.textValue
        let storyboard = UIStoryboard(name: "Repositories", bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() {
            present(controller, animated: true)
        }
    }

}

