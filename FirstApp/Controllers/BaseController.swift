import UIKit
import RxSwift

class BaseController: UIViewController {
    var disposable: Disposable?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        disposable?.dispose()
    }
}
