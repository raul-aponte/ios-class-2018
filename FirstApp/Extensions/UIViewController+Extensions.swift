import UIKit
import MBProgressHUD

extension UIViewController {
    func showProgress() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }

    func hideProgress() {
        MBProgressHUD.hide(for: view, animated: true)
    }

    func showAlert(_ message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "ok", style: .default) { _ in
            completion?()
        }
        alert.addAction(acceptAction)
        present(alert, animated: true, completion: nil)
    }

    func showError(_ error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        let acceptAction = UIAlertAction(title: "Accept", style: .default)
        alert.addAction(acceptAction)
        present(alert, animated: true, completion: nil)
    }
}
