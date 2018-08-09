//
//  EmbedView.swift
//  WebViewTest
//
//  Created by Li Yu on 8/7/18.
//  Copyright © 2018 personal. All rights reserved.
//

import UIKit
import MapKit

class EmbedView: UIView {

    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    
    }

    private func loadFromNib(){
        Bundle.main.loadNibNamed("EmbedView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
    }
    
     
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
