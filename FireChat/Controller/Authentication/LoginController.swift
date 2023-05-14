import Foundation
import UIKit

class LoginController : UIViewController {
    
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.setHeight(height: 50)
        
        let icon = UIImageView()
        icon.image = UIImage(systemName: "envelope")
        icon.tintColor = .white
        
        containerView.addSubview(icon)
        icon.centerY(inView: containerView)
        icon.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        icon.setDimensions(height: 24, width: 28)
        
        containerView.addSubview(emailTextField)
        emailTextField.anchor(top: icon.topAnchor,
                              left: icon.rightAnchor,
                              bottom: icon.bottomAnchor,
                              right: containerView.rightAnchor,
                              paddingLeft: 8,
                              paddingRight: 8)
        
        return containerView
    }()
    
    private lazy var passwordContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.setHeight(height: 50)
        
        let icon = UIImageView()
        icon.image = UIImage(systemName: "lock")
        icon.tintColor = .white
        
        containerView.addSubview(icon)
        icon.centerY(inView: containerView)
        icon.anchor(left: containerView.leftAnchor, paddingLeft: 8)
        icon.setDimensions(height: 28, width: 28)
        
        containerView.addSubview(passwordTextField)
        passwordTextField.anchor(top: icon.topAnchor,
                              left: icon.rightAnchor,
                              bottom: icon.bottomAnchor,
                              right: containerView.rightAnchor,
                              paddingLeft: 8,
                              paddingRight: 8)
        
        return containerView
    }()
    
    private let emailTextField: UITextField = {
        let tfView = UITextField()
        tfView.placeholder = "Email"
        tfView.textColor = .white
        return tfView
    }()
    
    private let passwordTextField: UITextField = {
        let tfView = UITextField()
        tfView.placeholder = "Password"
        tfView.textColor = .white
        tfView.isSecureTextEntry = true
        return tfView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemPink
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
        configureLogoView()
        configureStackView()
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
    
    private func configureStackView() {
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
}
