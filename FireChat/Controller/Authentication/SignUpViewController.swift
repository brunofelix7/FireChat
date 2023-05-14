import Foundation
import UIKit

class SignUpViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemPink
        navigationController?.navigationBar.isHidden = true
    }
}
