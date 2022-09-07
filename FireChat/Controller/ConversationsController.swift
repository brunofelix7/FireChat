import Foundation
import UIKit

class ConversationsController : UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func showProfile() {
        print("show profile")
    }
    
    // MARK: - Helpers
    func configureUI() {
        let imageIcon = UIImage(systemName: "person.circle.fill")
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageIcon, style: .plain,
                                                           target: self, action: #selector(showProfile))
    }
}
