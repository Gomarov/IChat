//
//  PeoplesViewController.swift
//  IChat
//
//  Created by  Pavel on 23.02.2021.
//

import UIKit

class PeoplesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate
extension PeoplesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - SwiftUI (canvas)
import SwiftUI

struct PeopleViewControllerProvider: PreviewProvider {
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tapBarVC = MainTapBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PeopleViewControllerProvider.ContainerView>) -> MainTapBarController {
            return tapBarVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<PeopleViewControllerProvider.ContainerView>) {
    
        }
    }
}
