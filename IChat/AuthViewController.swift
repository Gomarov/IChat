//
//  ViewController.swift
//  IChat
//
//  Created by  Pavel on 22.02.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    
   // let myButton = UIButton(

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }


}


import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<AuthViewControllerProvider.ContainerView>) {
    
        }
    }
}
