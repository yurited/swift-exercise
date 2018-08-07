//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Li Yu on 8/5/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                if let vc = segue.destination.contents as? ImageViewController {
                    vc.imageURL = url
                    vc.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
//        segue.destinationViewController
    }
}

extension UIViewController {
    var contents: UIViewController {
        if let navController = self as? UINavigationController {
            return navController.visibleViewController ?? self
        } else {
            return self
        }
    }
}
