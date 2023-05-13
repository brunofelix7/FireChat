import Foundation
import UIKit

class LoginController : UIViewController {
    
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private let emailContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.setHeight(height: 50)
        return view
    }()
    
    private let passwordContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.setHeight(height: 50)
        return view
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemRed
        button.setHeight(height: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        configureNavBar()
        configureGradientLayer()
        
        view.addSubview(logoImage)
        
        logoImage.centerX(inView: view)
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        logoImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView,
            passwordContainerView,
            loginButton])
        
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        
        stack.anchor(
            top: logoImage.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 32,
            paddingLeft: 32,
            paddingRight: 32)
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
