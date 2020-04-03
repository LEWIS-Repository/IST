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
    
    
    
    let data = [ CustomData(image: #imageLiteral(resourceName: "FR-Morvan-Extended-Virtual-Augmented-Reality-2400")),
                 CustomData(image: #imageLiteral(resourceName: "1*o85c5I6T07x3ZZCAWPgDfg")),
                 CustomData(image: #imageLiteral(resourceName: "cybersecurity-ts-100621287-large")),
                 CustomData(image: #imageLiteral(resourceName: "500_F_143433252_3F4OZ5qpnbnUrE9qKC8SoW3wz97eiZIb")),
                 CustomData(image: #imageLiteral(resourceName: "12")),
                 CustomData(image: #imageLiteral(resourceName: "Becoming-A-Better-Software-Developer-Square")),
                 CustomData(image: #imageLiteral(resourceName: "mobile-app-banner")),
                 CustomData(image: #imageLiteral(resourceName: "proactive-defense"))
                 
        
    ]
    
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var gifImage: UIImageView!
    
    
    
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
            
            
            //comments
            
      pageView.numberOfPages = data.count
           pageView.currentPage = 0
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            }
            
            view.addSubview(CollectionView)
             
            CollectionView.backgroundColor = .white
            
            CollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 100, left: 5, bottom: 180, right: 5))
            
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
           pageView.currentPage = counter}
        
    }

    @IBAction func shareButton(_ sender: Any) {
       let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
   @IBAction func webSite(_ sender: UIButton) {
        showSafariVC(for: "https://www.apple.com")}
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
            
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
        
    }

}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
        leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom{
        bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
            
        }
        if let trailing = trailing{
        trailingAnchor.constraint(equalTo: trailing,constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
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

