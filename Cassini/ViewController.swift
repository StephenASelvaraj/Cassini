//
//  ViewController.swift
//  Cassini
//
//  Created by Stephen Selvaraj on 8/13/18.
//  Copyright © 2018 Stephen Selvaraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageURL : URL? {
        didSet {
            imageVIew.image = nil
            if view.window != nil {
                fetchimage()
            }

        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageVIew.image == nil {
            fetchimage()
        }
    }
    //Use the intrinsic size of imageview property to clear warnings 
    @IBOutlet weak var imageVIew: UIImageView!
    
    func fetchimage() {
        if let url = imageURL {
       
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageVIew.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = demoURLs.pix
        }
    }
    
}

