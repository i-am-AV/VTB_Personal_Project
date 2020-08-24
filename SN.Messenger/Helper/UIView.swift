//
//  UIView.swift
//  SN.Messenger
//
//  Created by Alex Vasilyev on 22.08.2020.
//  Copyright © 2020 Alex Vasilyev. All rights reserved.
//

import UIKit

    //MARK: - AuthViewController


    //MARK: - Label

extension UILabel {
    
    func configurateHeaderLabel() {
        self.text = ""
    }
    
    func configurateAboutLabel() {
        
    }
    
    
}

    //MARK: - Button
extension UIButton {
    func configurateSignInButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("Войти в ВК", for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
}
    //MARK: - VKMessagesCell

extension UIView {
    
    func configurateCustomContentView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
    }
}

extension UIImageView {
    
    func configurateAvatarImageView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
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
        self.numberOfLines = 2
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

