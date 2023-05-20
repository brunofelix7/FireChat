import Foundation
import UIKit

class SignUpViewController : UIViewController {
    
    // MARK: Properties
    private let iconBack = UIImage(imageLiteralResourceName: "icon_back")
    private let imagePhoto = UIImage(imageLiteralResourceName: "icon_camera")
    private let iconEmail = UIImage(imageLiteralResourceName: "icon_email")
    private let iconLock = UIImage(imageLiteralResourceName: "icon_lock")
    private let iconUser = UIImage(imageLiteralResourceName: "icon_user")
    
    
    // MARK: Views
    private lazy var iconBackButton: UIButton = {
        let button = UIButton()
        button.setImage(iconBack, for: .normal)
        button.addTarget(self, action: #selector(backToSignIn), for: .touchUpInside)
        return button
    }()
    
    private lazy var photoImageButton: UIButton = {
        let button = UIButton()
        button.setImage(imagePhoto, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailTextField = TextFieldView("E-mail")
    private lazy var nameTextField = TextFieldView("Full name")
    private lazy var usernameTextField = TextFieldView("Username")
    private lazy var passwordTextField = TextFieldView("Password", isPassword: true)
    
    private lazy var emailContainerView = InputContainerView(iconEmail, emailTextField)
    private lazy var nameContainerView = InputContainerView(iconUser, nameTextField)
    private lazy var usernameContainerView = InputContainerView(iconUser, usernameTextField)
    private lazy var passwordContainerView = InputContainerView(iconLock, passwordTextField)
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 6
        button.backgroundColor = .lightText
        button.setHeight(height: 50)
        return button
    }()
    
    private lazy var stackContainerView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView,
            nameContainerView,
            usernameContainerView,
            passwordContainerView,
            signUpButton
        ])
        
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        
        stack.anchor(
            top: photoImageButton.bottomAnchor,
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
    @objc private func backToSignIn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func uploadPhoto() {
        print("Upload photo")
    }
    
    
    // MARK: UI Configuration
    private func configureUI() {
        configureNavBar()
        configureGradientLayer()
        configureBackButton()
        configurePhotoButton()
        configureStackContainer()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func configureBackButton() {
        view.addSubview(iconBackButton)
        iconBackButton.setDimensions(height: 24, width: 24)
        iconBackButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         paddingTop: 50,
                         paddingLeft: 32)
    }
    
    private func configurePhotoButton() {
        view.addSubview(photoImageButton)
        photoImageButton.centerX(inView: view)
        photoImageButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 50)
        photoImageButton.setDimensions(height: 128, width: 128)
    }
    
    private func configureStackContainer() {
        view.addSubview(stackContainerView)
    }
    
}
