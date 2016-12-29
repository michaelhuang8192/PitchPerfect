//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by pk on 12/27/16.
//  Copyright © 2016 Michael. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {case SLOW=0, FAST, CHIPMUNK, VADER, ECHO, REVERB}
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI(.notPlaying)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopAudio()
    }
    
    
    @IBAction func playButtonOnClick(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .SLOW:
            playSound(rate: 0.5)
        case .FAST:
            playSound(rate: 1.5)
        case .CHIPMUNK:
            playSound(pitch: 1000)
        case .VADER:
            playSound(pitch: -1000)
        case .ECHO:
            playSound(echo: true)
        case .REVERB:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonOnClick(_ sender: UIButton) {
        stopAudio()
    }

}
