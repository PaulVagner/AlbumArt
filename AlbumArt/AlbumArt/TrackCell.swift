//
//  TrackCell.swift
//  AlbumArt
//
//  Created by Paul Vagner on 10/13/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import SVGPlayButton

import AVFoundation

class TrackCell: UITableViewCell {

    
    var trackInfo: Track! {

        didSet  {
            
            if let price = trackInfo.trackPrice {
            
        buyButton.setTitle("$\(price)", forState: .Normal)

            } else {
                
                buyButton.hidden = true
                
            }
        }
            
    }
   
    
    @IBAction func pressedBuyButton(sender: AnyObject) {
    
        if let urlString = trackInfo.trackViewURL {
        
            print(urlString)
            
            if let url = NSURL(string: urlString) {
            
        UIApplication.sharedApplication().openURL(url)
        
                
            }
            
        }
    
    }
    
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var playButton: SVGPlayButton!
    
    @IBAction func pressedPlayButton(sender: SVGPlayButton) {
    
        print("pressed")
    
        
    }

    override func awakeFromNib() {
        
        
        //runs after loaded in storyboard
        
        print(playButton)
        
        playButton.willPlay = { self.willPlayHandler() }
        playButton.willPause = { self.willPauseHandler() }
        playButton.progressTrackColor = UIColor.blueColor()
        playButton.progressColor = UIColor.orangeColor()
        playButton.playColor = UIColor.redColor()
        playButton.pauseColor = UIColor.purpleColor()
        
        
    }
    
    var player: AVAudioPlayer?
    
    private func willPlayHandler() {
        
        if let data = trackInfo.mediaData ?? trackInfo.getMedia() {
         
            player = player ?? (try? AVAudioPlayer(data: data))
            
        }
        
        player?.play()
        
        print("willPlay")
    }
    
    private func willPauseHandler() {
        
        player?.pause()
        
        print("willPause")
    }
    
}
