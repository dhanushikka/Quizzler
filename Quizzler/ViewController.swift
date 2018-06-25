//
//  ViewController.swift
//  Quizzler
//
//

import UIKit

class ViewController: UIViewController {
    
    //instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if(sender.tag == 1){
            pickedAnswer = true
        }
        else if(sender.tag == 2){
            pickedAnswer = false
        }
        
        checkAnswer()
         questionNumber += 1
        nextQuestion()
        updateUI()
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        
        if(questionNumber<13){
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else{
            let alert = UIAlertController(title: "Game Over", message: "You finished all the questions. Do you want to start again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        //let correctAnswer = firstQuestion.answer
        
        if(pickedAnswer == correctAnswer){
            //print("you got it right")
            ProgressHUD.showSuccess("Right Answer!")
            score += 1
            
            
        }
        else{
            print("wrong")
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
        
    }
    

    
}
