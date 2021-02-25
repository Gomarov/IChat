//
//  ActiveChatCell.swift
//  IChat
//
//  Created by  Pavel on 25.02.2021.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "ActiveChatCell"
    
    let frinedImageView = UIImageView()
    let friendName = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientView = UIView()
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
    func configure(with value: MChat) {
        frinedImageView.image = UIImage(named: value.userImageString)
        friendName.text = value.username
        lastMessage.text = value.lastMessage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup constraints
extension ActiveChatCell {
    private func setupConstraints() {
        frinedImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        frinedImageView.backgroundColor = .orange
        gradientView.backgroundColor = .black
        
        addSubview(frinedImageView)
        addSubview(gradientView)
        addSubview(friendName)
        addSubview(lastMessage)
        
        NSLayoutConstraint.activate([
            frinedImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            frinedImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            frinedImageView.heightAnchor.constraint(equalToConstant: 78),
            frinedImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            friendName.leadingAnchor.constraint(equalTo: frinedImageView.trailingAnchor, constant: 16),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
            
        ])
        
        NSLayoutConstraint.activate([
            lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lastMessage.leadingAnchor.constraint(equalTo: frinedImageView.trailingAnchor, constant: 16),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
        
    }
}

// MARK: - SwiftUI (canvas)
import SwiftUI

struct ActiveChatProvider: PreviewProvider {
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupVC = ListViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) -> ListViewController {
            return setupVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) {
    
        }
    }
}
