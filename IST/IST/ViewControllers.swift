//
//  ViewControllers.swift
//  IST
//
//  Created by Mohamed Alsaidi on 3/27/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit

class ViewControllers: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var picTures = [#imageLiteral(resourceName: "colored"), #imageLiteral(resourceName: "colored")]
    var videos:[Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
    let video = Video()
    video.Key = "FpeiRBTX7mk"
    video.Title = "video"
    videos.append(video)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewTableViewCell
        
        cell.videoImage.image = picTures[indexPath.row]
        
               return cell
    }
    
    
    class Video{
        var Key:String = ""
        var Title:String = ""
    }
    
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
