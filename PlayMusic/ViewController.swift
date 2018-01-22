//
//  ViewController.swift
//  PlayMusic
//
//  Created by Tan on 1/22/18.
//  Copyright © 2018 Ngoc Tan. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate {
var audio = AVAudioPlayer()
    var count : Int!
    
    @IBAction func btnPlay(_ sender: Any) {
        audio.play()
        
        
        if (count % 2 == 0){
            FEPlay.setImage(UIImage(named : "play.png"), for: .normal)
            audio.pause()
            print("stop")
        }else{
            FEPlay.setImage(UIImage(named : "pause.png"), for: .normal)
            audio.play(atTime: 0)
            print("playing")
            audio.play()
        }
        count = count + 1
    }

    @IBOutlet weak var sliderDist: UISlider!
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var lblFrom: UILabel!
    @IBOutlet weak var FEPlay: UIButton!
    @IBAction func slider_change(_ sender: UISlider) {
        audio.volume = sender.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FEPlay.setImage(UIImage(named: "play.png"), for: .normal)
       count = 1
        audio = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: ".mp3")!) as URL)
        audio.prepareToPlay()
        audio.play()
        lblTo.text = String(format: "%2.2f",audio.duration/60)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getTrackSlider), userInfo: nil, repeats: true)
    }
    @objc func getTrackSlider(){
        //print(audio.currentTime)
//        lblFrom.text = String("\(audio.currentTime / 60) : \(audio.currentTime.truncatingRemainder(dividingBy: 60))")
//
        lblFrom.text = String(format: "%2.2f", audio.currentTime/60)
        sliderDist.value = Float(audio.currentTime / audio.duration)
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Done")
    }

}

