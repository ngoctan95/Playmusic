//
//  ViewController.swift
//  PlayMusic
//
//  Created by Tan on 1/22/18.
//  Copyright © 2018 Ngoc Tan. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
var audio = AVAudioPlayer()
    var count : Int!
    
    @IBAction func btnPlay(_ sender: Any) {
        audio.play()
        FEPlay.setImage(UIImage(named : "pause"), for: .normal)
        count = count + 1
        if (count % 2 == 0){
            audio.stop()
            print("stop")
        }else{
            print("playing")
            audio.play()
        }
    }

    @IBOutlet weak var FEPlay: UIButton!
    @IBAction func slider_change(_ sender: UISlider) {
        print(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       count = 1
        audio = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: ".mp3")!) as URL)
//        audio = try! AVAudioPlayer(contentsOf: URL.init(from: Bundle.main.path(forResource: "music", ofType: "mp3") as! Decoder))
        audio.prepareToPlay()
    }
}

