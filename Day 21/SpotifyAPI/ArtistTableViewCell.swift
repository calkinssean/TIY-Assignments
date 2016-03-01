//
//  ArtistTableViewCell.swift
//  SpotifyAPI
//
//  Created by Sean Calkins on 2/29/16.
//  Copyright © 2016 Dape App Productions LLC. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func loadImageFromURL(urlString: String) {
        
        if urlString.isEmpty == false {
            
            dispatch_async(dispatch_get_main_queue(), {
                if let url = NSURL(string: urlString) {
                    if let data = NSData(contentsOfURL: url) {
                        self.artistImageView.image = UIImage(data: data)
                    }
                }
            })
        } else {
            debugPrint("Invalid \(urlString)")
        }
    }

}
