import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    // MARK: Properties
    private let iconBubble = UIImage(systemName: "bubble.right")
    private let iconEmail = UIImage(imageLiteralResourceName: "icon_email")
    private let iconLock = UIImage(imageLiteralResourceName: "icon_lock")
    
    // MARK: Views
    private lazy var emailContainerView = InputContainerView(icon: iconEmail, textField: emailTextField)
    private lazy var passwordContainerView = InputContainerView(icon: iconLock, textField: passwordTextField)
    private lazy var emailTextField = TextFieldView(placeholder: "E-mail")
    private lazy var passwordTextField = TextFieldView(placeholder: "Password", isPassword: true)
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = iconBubble
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemPink
        button.setHeight(height: 50)
        return button
    }()
    
    private lazy var stackContainerView: UIStackView = {
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
        return stack
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        configureNavBar()
        configureGradientLayer()
        configureLogoView()
        configureStackContainerView()
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
    
    private func configureLogoView() {
        view.addSubview(logoImage)
        logoImage.centerX(inView: view)
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        logoImage.setDimensions(height: 120, width: 120)
    }
    
    private func configureStackContainerView() {
        view.addSubview(stackContainerView)
    }
}
