import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    // MARK: Properties
    private var viewModel = LoginViewModel()
    private let iconBubble = UIImage(systemName: "bubble.right")
    private let iconEmail = UIImage(imageLiteralResourceName: "icon_email")
    private let iconLock = UIImage(imageLiteralResourceName: "icon_lock")
    
    
    // MARK: Views
    private lazy var emailTextField = TextFieldView("E-mail")
    private lazy var passwordTextField = TextFieldView("Password", isPassword: true)
    
    private lazy var emailContainerView = TextFieldContainerView(iconEmail, emailTextField)
    private lazy var passwordContainerView = TextFieldContainerView(iconLock, passwordTextField)
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = iconBubble
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .lightText
        button.isEnabled = false
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        button.setHeight(height: 50)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ",
                                                        attributes: [
                                                            .font: UIFont.systemFont(ofSize: 16),
                                                            .foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up",
                                                  attributes: [
                                                    .font: UIFont.boldSystemFont(ofSize: 16),
                                                    .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(showSignUpView), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackContainerView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView,
            passwordContainerView,
            loginButton
        ])
        
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        
        stack.anchor(
            top: logoImage.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingTop: 32,
            paddingLeft: 32,
            paddingRight: 32
        )
        return stack
    }()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: Selectors
    @objc private func loginUser() {
        print("DEBUG: Login user here...")
    }
    
    @objc private func showSignUpView() {
        let controller = SignUpViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func textFieldListener(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        validadeForm()
    }
    
    
    // MARK: Helpers
    private func validadeForm() {
        if viewModel.formIsValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .purple
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .lightText
        }
    }
    
    
    // MARK: UI Configuration
    private func configureUI() {
        configureNavBar()
        configureGradientLayer()
        configureLogo()
        configureStackContainer()
        configureSignUpButton()
        configureTextFieldListener()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func configureLogo() {
        view.addSubview(logoImage)
        logoImage.centerX(inView: view)
        logoImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        logoImage.setDimensions(height: 120, width: 120)
    }
    
    private func configureStackContainer() {
        view.addSubview(stackContainerView)
    }
    
    private func configureSignUpButton() {
        view.addSubview(signUpButton)
        signUpButton.centerX(inView: view)
        signUpButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16)
    }
    
    private func configureTextFieldListener() {
        emailTextField.addTarget(self, action: #selector(textFieldListener), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldListener), for: .editingChanged)
    }
}
