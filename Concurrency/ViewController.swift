//
//  ViewController.swift
//  Concurrency
//
//  Created by Alex Paul on 12/5/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var planetImageView: UIImageView!
  
    let imageArray = ["https://cdn.arstechnica.net/wp-content/uploads/2016/02/5718897981_10faa45ac3_b-640x624.jpg", "https://apod.nasa.gov/apod/image/1912/NGC6744_FinalLiuYuhang.jpg", "https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg", "https://image.shutterstock.com/z/stock-photo-large-beautiful-drops-of-transparent-rain-water-on-a-green-leaf-macro-drops-of-dew-in-the-morning-668593321.jpg", "https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg", "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://www.w3schools.com/w3css/img_lights.jpg"]
    let imageURLString = "https://apod.nasa.gov/apod/image/1912/NGC6744_FinalLiuYuhang.jpg"

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func loadImage(_ sender: UIBarButtonItem) {
    guard let url = URL(string: imageArray.randomElement() ?? "") else {
        fatalError("bad url \(imageURLString)")
    }
    //    do {
    //      let imageData = try Data(contentsOf: url)
    //      let image = UIImage(data: imageData)
    //      planetImageView.image = image
    //    } catch {
    //      print("loading contents error: \(error)")
    //    }
    //  }
    
    
    planetImageView.load(url: url)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let imageData = try Data(contentsOf: url)
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.image = image
                }
            } catch {
                print("contents of error: \(error)")
            }
        }
    }
}
