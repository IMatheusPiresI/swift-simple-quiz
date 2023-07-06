//
//  ViewController.swift
//  MVC-Quiz
//
//  Created by Matheus Sousa on 05/07/23.
//

import UIKit

class HomeController: UIViewController {
    
    var screen: HomeScreen?
    var quizBrain =  QuizBrain()
    
    
    override func loadView(){
        super.loadView()
        self.screen = HomeScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
        self.screen?.questionLabel.text = quizBrain.getCurrentQuestionLabel()
        self.screen?.scoreLabel.text = "Score: \(quizBrain.score)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func updateUI() {
        self.screen?.questionLabel.text = quizBrain.getCurrentQuestionLabel()
        self.screen?.scoreLabel.text = "Score: \(quizBrain.score)"
        self.screen?.trueButton.backgroundColor = .clear
        self.screen?.falseButton.backgroundColor = .clear
        self.screen?.progressBar.progress = quizBrain.getProgress()
    }
}

extension HomeController: HomeScreenDelegate {
    func tappedAwnserButton(_ sender: UIButton) {
        let userAwnser = sender.currentTitle!
        let isCorrectAwnser = quizBrain.checkUserAwnser(userAwnser)
    
        if isCorrectAwnser {
            sender.backgroundColor = .green
        }else {
            sender.backgroundColor = .red
        }

        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.200, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
}

