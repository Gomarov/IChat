//
//  SelfConfiguringCell.swift
//  IChat
//
//  Created by  Pavel on 27.02.2021.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
