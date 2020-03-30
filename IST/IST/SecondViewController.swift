//
//  SecondViewController.swift
//  IST
//
//  Created by IST on 2/12/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit
import SafariServices

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    let backgroundImageView = UIImageView()
        
    var interests = Interest.fetchInterests()
    let cellScaling: CGFloat = 0.6
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            setBackground()
            /*let screenSize = UIScreen.main.bounds.size
            let cellWidth = floor(screenSize.width * cellScaling)
            let cellHeight = floor(screenSize.height * cellScaling)
            
            let insetX = (view.bounds.width - cellWidth) / 2.0
            let insetY = (view.bounds.height - cellHeight) / 2.0*/
            
            
            
            
            CollectionView?.dataSource = self
            
        }

    @IBAction func shareButton(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    @IBAction func webSite(_ sender: UIButton) {
        showSafariVC(for: "https://www.apple.com")
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
        func setBackground() {
            view.addSubview(backgroundImageView)
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            backgroundImageView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            backgroundImageView.image = UIImage(named: "colored")
            view.sendSubviewToBack(backgroundImageView)
        }
    }

extension SecondViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCollectionViewCell
        let interest = interests[indexPath.item]
        
        cell.interest = interest
        return cell
    }
    
    
}


