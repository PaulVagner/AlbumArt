//
//  AlbumDetailViewController.swift
//  AlbumArt
//
//  Created by Paul Vagner on 10/13/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    
    var albumInfo: Album!
    
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var tracksTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        albumNameLabel.text = albumInfo.albumName
        
        albumImageView.image = albumInfo.albumImage ?? albumInfo.getImage()
        
        albumImageView.contentMode = .ScaleAspectFill
    
    }

}
