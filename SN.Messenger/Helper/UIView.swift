//
//  UIView.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

extension UIView {
    
    func configurateCustomContentView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.backgroundColor = UIColor.green.cgColor
    }
}

extension UIImageView {
    
    func configurateAvatarImageView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.contentMode = .scaleAspectFit
    }
}

extension UILabel {
    
    func configurateNameLabel() {
        configurateLabel()
        self.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        self.textColor = .black
    }
    
    func configurateMessageTextLabel() {
        configurateLabel()
        self.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.textColor = .systemGray
        self.numberOfLines = 3
    }
    
    func configurateDateLabel() {
        configurateLabel()
        self.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.textColor = .systemGray
        self.textAlignment = .right
    }
    
    private func configurateLabel() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 1
        self.textAlignment = .left
    }
}

extension UIStackView {
    
    func configurateVerticalStackView() {
        configurateStackView()
        self.axis = .vertical
        self.spacing = 2
    }
    
    func configurateHorizontalStackView() {
        configurateStackView()
        self.axis = .horizontal
        self.spacing = 8
    }
    
    private func configurateStackView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = .fill
        self.distribution = .fill
    }
}

extension UIButton {
    func configurateSignInButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.imageView?.image.setim
        self.setTitle("Sign In", for: .normal)
        //        self.font = UIFont.systemFont(ofSize: <#T##CGFloat#>,
        //                                      weight: <#T##UIFont.Weight#>)
        
    }
}
