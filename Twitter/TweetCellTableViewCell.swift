//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Byron M Wilson on 3/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBOutlet weak var TweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    var favorited: Bool = false
    var tweetID:Int = -1
    var retweeted:Bool = false
    
    
    @IBAction func favortite(_ sender: Any) {
       var favorited: Bool = false
       var tweetID:Int = -1
       
        let tobeFavorited = !favorited
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
                setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetID, success: {
                )setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
        }
    }
   
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
        func retweet(_ sender: Any) {
        TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
            self.setRetweeted(true)
        }, failure: {(error) in
            print("Error in Retweeting: \(error)")
        })
        }
        func setRetweeted(_ isRetweeted:Bool){
            if (isRetweeted){
                retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
                retweetButton.isEnabled = false
                
            }else{
                retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
                            retweetButton.isEnabled = true
                            
            }
            
        }
    
    
        func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

        func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    }
}
