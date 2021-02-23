//
//  UIImageView + Extension.swift
//  IChat
//
//  Created by Pavel on 22.02.2021.
//

import UIKit

extension UIImageView {
    convenience init(image:UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
