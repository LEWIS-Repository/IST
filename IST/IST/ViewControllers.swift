//
//  ViewControllers.swift
//  IST
//
//  Created by Mohamed Alsaidi on 3/27/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit

class ViewControllers: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var picTures = [#imageLiteral(resourceName: "video1"), #imageLiteral(resourceName: "video2"), #imageLiteral(resourceName: "video1")]
    var videos:[Video] = []
    
    var video:Video = Video()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
    let video = Video()
    video.Key = "4EisdIeXalo"
    video.Title = "First Video"
    videos.append(video)
        
        let video2 = Video()
        video2.Key = "CPimeZXvrxk"
        video2.Title = "Second Video"
        videos.append(video2)
        
        let video3 = Video()
        video3.Key = "BLnHKgRjDj0"
        video3.Title = "three Video"
        videos.append(video3)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
        
        cell.videoLabel.text = videos[indexPath.row].Title
        cell.videoImage.image = picTures[indexPath.row]
        
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vi = videos[indexPath.row]
        self.video = vi
        
        performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toVideo" {
            let vc = segue.destination as! VideoViewController
            vc.video = self.video
    }
    }
}


  class Video{
      var Key:String = ""
      var Title:String = ""
  }
/*extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
                let image = UIImage(data: data)
                else {return}
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else {return}
        downloaded(from: url, contentMode: mode)
    }
}*/
