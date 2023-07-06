//
//  HomeScreen.swift
//  MVC-Quiz
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedAwnserButton(_ sender: UIButton)
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    public func delegate(delegate: HomeScreenDelegate?){
        self.delegate = delegate
    }
    
    lazy var backgroundView: UIView = {
       let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray

        return view
    }()

    lazy var scoreLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
    
        return label
    }()
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .natural
        
        return label
    }()
    
    lazy var trueButton: UIButton = {
       let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("True", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(tappedAwnserButton), for: .touchUpInside)
        button.addOpacityEffect()
        
        return button
    }()
    
    lazy var falseButton: UIButton = {
       let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("False", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(tappedAwnserButton), for: .touchUpInside)
        button.addOpacityEffect()
        
        
        return button
    }()
    
    lazy var progressBar: UIProgressView = {
        let progress  = UIProgressView()
        
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0
        progress.tintColor = .white
        progress.backgroundColor = .darkGray
        progress.layer.borderWidth = 0.5
        progress.layer.borderColor = UIColor.white.cgColor
        
        return progress
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.backgroundView)
        self.addSubview(self.scoreLabel)
        self.addSubview(self.questionLabel)
        self.addSubview(self.progressBar)
        self.addSubview(self.trueButton)
        self.addSubview(self.falseButton)
        
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedAwnserButton(_ sender: UIButton){
        self.delegate?.tappedAwnserButton(sender)
    }

    func configConstraints(){
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.scoreLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.scoreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.questionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.progressBar.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.progressBar.heightAnchor.constraint(equalToConstant: 4),
            self.progressBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.progressBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.trueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.trueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.trueButton.bottomAnchor.constraint(equalTo: self.falseButton.topAnchor, constant: -16),
            self.trueButton.heightAnchor.constraint(equalToConstant: 56),
            
            self.falseButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.falseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.falseButton.bottomAnchor.constraint(equalTo: self.progressBar.bottomAnchor, constant: -20),
            self.falseButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    
}
