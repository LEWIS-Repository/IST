//
//  VideoViewController.swift
//  IST
//
//  Created by Mohamed Alsaidi on 3/27/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    var video:Video = Video()
    
    @IBOutlet weak var videoWebView: UIWebView!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImage.loadGif(name: "giphy")
        getVideo(videokey: video.Key)
        
        // Do any additional setup after loading the view.
    }
    func getVideo(videokey:String){
        let url = URL(string: "https://www.youtube.com/embed/\(videokey)")
        videoWebView.loadRequest(URLRequest(url: url!))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
