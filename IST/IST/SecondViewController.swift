//
//  SecondViewController.swift
//  IST
//
//  Created by IST on 2/12/20.
//  Copyright © 2020 IST. All rights reserved.
//

import UIKit
import SafariServices

struct CustomData {
    var image: UIImage
}


class SecondViewController: UIViewController {
    
    let data = [ CustomData(image: #imageLiteral(resourceName: "video2")),
                 CustomData(image: #imageLiteral(resourceName: "colored")),
                 CustomData(image: #imageLiteral(resourceName: "video1"))
    ]
    
    @IBOutlet weak var pageView: UIPageControl!
    
        
    fileprivate let CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    var timer = Timer()
    var counter = 0
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            pageView.numberOfPages = data.count
            pageView.currentPage = 0
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            }
            
            
          
            view.addSubview(CollectionView)
            CollectionView.backgroundColor = .white
            CollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 280).isActive = true
            CollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
            CollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
            CollectionView.heightAnchor.constraint(equalTo: CollectionView.widthAnchor, multiplier: 1.0).isActive = true
            
            
            CollectionView.delegate = self
            CollectionView.dataSource = self
            
        }
    
    @objc func changeImage() {
        if counter < data.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.CollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        }else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.CollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
        }
        
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
    

    }

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.0, height: collectionView.frame.width/1)
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
}

class CustomCell: UICollectionViewCell {
    var data: CustomData? {
        didSet {
            guard let data = data else {return}
            bg.image = data.image
        }
    }
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "video1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

