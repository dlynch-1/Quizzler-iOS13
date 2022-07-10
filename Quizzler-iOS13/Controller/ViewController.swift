//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choice1Button.setTitle(quizBrain.getAnswerText(0), for: UIControl.State.normal)
        choice2Button.setTitle(quizBrain.getAnswerText(1), for: UIControl.State.normal)
        choice3Button.setTitle(quizBrain.getAnswerText(2), for: UIControl.State.normal)

        let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.choice1Button.backgroundColor = UIColor.clear
            self.choice2Button.backgroundColor = UIColor.clear
            self.choice3Button.backgroundColor = UIColor.clear
        }
    }
}

