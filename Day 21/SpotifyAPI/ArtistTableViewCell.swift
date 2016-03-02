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
            if let url = NSURL(string: urlString) {
                let session = NSURLSession.sharedSession()
                let task = session.dataTaskWithURL(url, completionHandler: {
                    (data, response, error) in
                    if error != nil {
                        debugPrint("An error occurred \(error)")
                        return
                    }
                    let theFinalImage = UIImage(data: data!)
                    dispatch_async(dispatch_get_main_queue(), {
                        self.artistImageView.image = theFinalImage
                    })
                })
                task.resume()
                
            } else {
                print("Not a valid url")
            }
        } else {
            debugPrint("Invalid \(urlString)")
        }
    }
}
