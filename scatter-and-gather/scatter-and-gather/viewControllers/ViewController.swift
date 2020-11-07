//
//  ViewController.swift
//  scatter-and-gather
//
//  Created by Jeff Kang on 11/6/20.
//

import UIKit

class ViewController: UIViewController {
    
    private var isScattered: Bool = false
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    private var uiLabels: [UILabel] = []
    
    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
        
        if(self.isScattered == false) {
            
            UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4.0) {
                    self.lambdaLogo.alpha = 0.0
                }
                
                self.uiLabels.map {
                    $0.textColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
                    $0.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
                    $0.transform = CGAffineTransform(rotationAngle: .random(in: -1...1))
                        .translatedBy(x: .random(in: 0...(self.view.frame.maxX - $0.frame.origin.x - $0.bounds.width)), y: .random(in: 0...(self.view.frame.maxY - $0.frame.origin.y - $0.bounds.height)))
                }
                
                self.isScattered = true
                
            }, completion: nil)
        } else {
            
            UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4.0) {
                    self.lambdaLogo.alpha = 1.0
                }
                
                self.uiLabels.map {
                    $0.textColor = .black
                    $0.backgroundColor = .clear
                    $0.transform = .identity
                }
                
                self.isScattered = false
                
            }, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.uiLabels = [firstLabel, secondLabel, thirdLabel, fourthLabel, fifthLabel, sixthLabel]
    }


}

