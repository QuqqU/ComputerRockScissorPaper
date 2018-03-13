//
//  ViewController.swift
//  computerRSP
//
//  Created by 정기웅 on 2018. 3. 9..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var leftImg: UIImageView!
    @IBOutlet weak var rightImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        setButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(_ sender: Any) {
        let left = arc4random() % 3
        let right = arc4random() % 3
        
        if left == 0 {
            leftImg.image = resizeImage(image: UIImage(named: "rock.png")!, targetSize: CGSize(width: 240, height: 240))
        }
        else if left == 1 {
            leftImg.image = resizeImage(image: UIImage(named: "paper.png")!, targetSize: CGSize(width: 240, height: 240))
        }
        else {
            leftImg.image = resizeImage(image: UIImage(named: "scissor.png")!, targetSize: CGSize(width: 240, height: 240))
        }
        
        if right == 0 {
            rightImg.image = resizeImage(image: UIImage(named: "rock.png")!, targetSize: CGSize(width: 240, height: 240))
        }
        else if right == 1 {
            rightImg.image = resizeImage(image: UIImage(named: "paper.png")!, targetSize: CGSize(width: 240, height: 240))
        }
        else {
            rightImg.image = resizeImage(image: UIImage(named: "scissor.png")!, targetSize: CGSize(width: 240, height: 240))
        }
    }
    
    func setImage() {

        
        leftImg.image = resizeImage(image: UIImage(named: "rock.png")!, targetSize: CGSize(width: 240, height: 240))
        rightImg.image = resizeImage(image: UIImage(named: "rock.png")!, targetSize: CGSize(width: 240, height: 240))
    
        leftImg.frame.origin.x = 75
        leftImg.frame.origin.y = (height - leftImg.bounds.size.height) / 2
        
        rightImg.frame.origin.x = width - 75 - rightImg.bounds.width
        rightImg.frame.origin.y = (height - rightImg.bounds.size.height) / 2
    }
    
    func setButton() {
        playBtn.frame.origin = CGPoint(x: (width - playBtn.bounds.size.width) / 2,
                                       y: (height - playBtn.bounds.size.height) / 2)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    ////
    
    
}

