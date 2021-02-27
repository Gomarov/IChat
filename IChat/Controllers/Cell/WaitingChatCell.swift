//
//  WaitingChatCell.swift
//  IChat
//
//  Created by  Pavel on 27.02.2021.
//

import UIKit

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "WaitingChatCell"
    
    let friendImageView = UIImageView() 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        setupConstraints()
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        friendImageView.image = UIImage(named: chat.userImageString)
    }
    
    
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)
        
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SwiftUI (canvas)
import SwiftUI

struct WaitingChatProvider: PreviewProvider {
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupVC = ListViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) -> ListViewController {
            return setupVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) {
    
        }
    }
}
