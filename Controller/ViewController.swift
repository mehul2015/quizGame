import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreTrack: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        updateUI()
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPressedAnswer(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let temp = quizBrain.checkAnswer(userAnswer)
        if temp==true {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreTrack.text = "Score: \(quizBrain.getScore())"
        buttonFalse.backgroundColor=UIColor.clear
        buttonTrue.backgroundColor=UIColor.clear
        }
}

