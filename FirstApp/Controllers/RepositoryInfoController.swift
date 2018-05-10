import UIKit

class RepositoryInfoController: BaseController {
    var repository: Repository?
    @IBOutlet weak var repositoryInfoView: RepositoryInfoView!

    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryInfoView.repository = repository
    }
}
