//
//  ViewController.swift
//  ImageSizing
//
//  Created by Алексей Пархоменко on 20/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var images = ["1","2","3","4","5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: "ImageViewCell")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as! ImageViewCell
        cell.mainImageView.image = UIImage(named: "\(images[indexPath.row])")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage = UIImage(named: "\(images[indexPath.row])")
        let imageCrop = currentImage?.getCropRation()
        return tableView.frame.width / imageCrop!
    }
}

extension UIImage {
    func getCropRation() -> CGFloat {
       var widhtRatio = CGFloat(self.size.width / self.size.height)
        return widhtRatio
    }
}
