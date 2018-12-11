// Created on: November 22
// Created by: Nicholas.Pasco-Arnone
// Created for: ICS3U
// This program will calculate 
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel : UILabel = UILabel()
    let calculateButton : UIButton = UIButton()
    let startButton : UIButton = UIButton()
    var numberOne : Int = Int(arc4random_uniform(100) + 1)
    var numberTwo : Int = Int(arc4random_uniform(100) + 1)
    var aSDM : Int = Int(arc4random_uniform(3) + 1)
    var numberOneLabel = UILabel()
    var numberTwoLabel = UILabel()
    var aSDMLabel = UILabel()
    var answerTextField = UITextField()
    var scoreBoard : Int = Int(0)
    var scoreBoardLabel = UILabel()
    var answerLabel = UILabel()
    let nextQuestionButton = UIButton()
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Can you solve the equation?"
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        numberOneLabel.text = nil
        view.addSubview(numberOneLabel)
        numberOneLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOneLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        numberOneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        aSDMLabel.text = nil
        view.addSubview(aSDMLabel)
        aSDMLabel.translatesAutoresizingMaskIntoConstraints = false
        aSDMLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        aSDMLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        numberTwoLabel.text = nil
        view.addSubview(numberTwoLabel)
        numberTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        numberTwoLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20).isActive = true
        numberTwoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        
        
        answerTextField.placeholder = "Enter your answer"
        view.addSubview(answerTextField)
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        answerTextField.topAnchor.constraint(equalTo: numberOneLabel.bottomAnchor, constant: 40).isActive = true
        answerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        calculateButton.setTitle("calculate", for: UIControl.State.normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        calculateButton.topAnchor.constraint(equalTo: answerTextField.bottomAnchor, constant: 20).isActive = true
        
        startButton.setTitle("Start game", for: UIControl.State.normal)
        startButton.setTitleColor(.blue, for: .normal)
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.topAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: 190).isActive = true
        
        answerLabel.text = nil
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 150).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        nextQuestionButton.setTitle("Next question", for: UIControl.State.normal)
        nextQuestionButton.setTitleColor(.blue, for: .normal)
        nextQuestionButton.addTarget(self, action: #selector(nextquestion), for: .touchUpInside)
        view.addSubview(nextQuestionButton)
        nextQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        nextQuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 300).isActive = true
        nextQuestionButton.topAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: 0).isActive = true
    }
    @objc func nextquestion() {
        numberOne = Int(arc4random_uniform(100) + 1)
        numberTwo = Int(arc4random_uniform(100) + 1)
        aSDM = Int(arc4random_uniform(3) + 1)
        
        numberOneLabel.text = String(numberOne)
        numberTwoLabel.text = String(numberTwo)
        if aSDM == 1 {
            aSDMLabel.text = "+"
        }
        else if aSDM == 2 {
            aSDMLabel.text = "-"
        }
        else if aSDM == 3{
            aSDMLabel.text = "*"
        }
        var answer = 0
        if aSDM == 1 {
            answer = numberOne + numberTwo
        }
        else if aSDM == 2 {
            answer = numberOne - numberTwo
        }
            
        else if aSDM == 3 {
            answer = numberOne * numberTwo
        }
        answerLabel.text = nil
    }
    
    @objc func calculate() {
        var answer = 0
        if aSDM == 1 {
             answer = numberOne + numberTwo
        }
        else if aSDM == 2 {
        answer = numberOne - numberTwo
    }
        
        else if aSDM == 3 {
            answer = numberOne * numberTwo
            }
        if Double(answerTextField.text!) == Double(answer)  {
            
            answerLabel.text = "Correct!"
            
            var counter = scoreBoard + 1
            scoreBoard = counter
            
            scoreBoardLabel.text = "score \(scoreBoard)"
            view.addSubview(scoreBoardLabel)
            scoreBoardLabel.translatesAutoresizingMaskIntoConstraints = false
            scoreBoardLabel.topAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: 0).isActive = true
            scoreBoardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 450).isActive = true
        }
        else if Double(answerTextField.text!) != Double(answer)  {
            
            answerLabel.text = "incorrect the correct answer was: \(answer)"
            var counter2 = scoreBoard - 1
            scoreBoard = counter2
            
            if scoreBoard < 0 {
                scoreBoard = 0
                counter2 = scoreBoard
            }
            
            scoreBoardLabel.text = "score \(scoreBoard)"
            view.addSubview(scoreBoardLabel)
            scoreBoardLabel.translatesAutoresizingMaskIntoConstraints = false
            scoreBoardLabel.topAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: 0).isActive = true
            scoreBoardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 450).isActive = true
        }
}
    @objc func start() {
        if aSDM == 1 {
            aSDMLabel.text = "+"
        }
        else if aSDM == 2 {
        aSDMLabel.text = "-"
    }
        else if aSDM == 3{
        aSDMLabel.text = "*"
    }
        numberOneLabel.text = String(numberOne)
        numberTwoLabel.text = String(numberTwo)
}
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
