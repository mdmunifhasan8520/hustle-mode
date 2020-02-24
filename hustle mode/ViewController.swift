//
//  ViewController.swift
//  hustle mode
//
//  Created by Mac PC on 2/24/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
        //MARK: IBoutlet
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    //Create Audio Player Object
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Grab Audio File in local storage
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        do {
            audioPlayer = try AVAudioPlayer.init(contentsOf: url)
            audioPlayer.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
        //MARK:Power Button Events
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        audioPlayer.play()
        
        //MARK: Animation
        UIView.animate(withDuration: 2.0, animations: {
            self.rocket.frame = CGRect(x: 0, y: 40, width: 375, height: 603)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    
}

