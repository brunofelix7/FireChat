import Foundation
import UIKit

class InputContainerView : UIView {
    
    init(_ icon: UIImage?, _ textField: UITextField) {
        super.init(frame: .zero)
        
        setHeight(height: 50)
        
        let imageView = UIImageView()
        imageView.image = icon
        imageView.tintColor = .white
        imageView.alpha = 0.87
        
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 24, width: 24)
        
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(top: imageView.topAnchor,
                              left: imageView.rightAnchor,
                              bottom: imageView.bottomAnchor,
                              right: rightAnchor,
                              paddingLeft: 8,
                              paddingRight: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        
        addSubview(dividerView)
        dividerView.setHeight(height: 1)
        dividerView.anchor(left: leftAnchor,
                           bottom: bottomAnchor,
                           right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
